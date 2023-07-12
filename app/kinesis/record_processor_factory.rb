# frozen_string_literal: true

class RecordProcessorFactory < Kcl::RecordProcessorFactory
  def create_processor
    RecordProcessor.new
  end
end
