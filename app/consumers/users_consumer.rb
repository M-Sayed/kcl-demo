class UsersConsumer
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def consume
    Kcl.logger.info "UsersConsumer: #{data}"
  end
end
