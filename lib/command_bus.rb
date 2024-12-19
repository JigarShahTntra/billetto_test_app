class CommandBus
  def initialize
    @handlers = {}
  end

  def register(command_class, handler)
    @handlers[command_class] = handler
  end

  def call(command)
    handler = @handlers[command.class]
    raise "Handler not found for #{command.class}" unless handler

    handler.call(command)
  end
end
