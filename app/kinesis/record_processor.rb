# frozen_string_literal: true

class RecordProcessor < Kcl::RecordProcessor
  def after_initialize(initialization_input)
  end

  def process_records(records_input)
    Kcl.logger.info('Processing records...')

    Kcl.logger.info "EMPTY" if records_input.records.empty?
    return if records_input.records.empty?

    records_input.records.each do |record|
      data = JSON.parse(Base64.strict_decode64(record[:data]))
      consumer_klass = "#{data["namespace"]}Consumer".constantize

      consumer_klass.new(data).consume
    end

    last_sequence_number = records_input.records[-1].sequence_number

    records_input.record_checkpointer.update_checkpoint(last_sequence_number)
  end

  def shutdown(shutdown_input)
    Kcl.logger.info("Shutdown reason: #{shutdown_input.shutdown_reason}")

    if shutdown_input.shutdown_reason == Kcl::Workers::ShutdownReason::TERMINATE
      shutdown_input.record_checkpointer.update_checkpoint(nil)
    end
  end
end
