class EmailsConsumer
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def consume
    Kcl.logger.info "EmailsConsumer: #{data}"
  end
end
