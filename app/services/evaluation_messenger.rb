class EvaluationMessenger
  # In order to publish message we need a exchange name.
  # Note that RabbitMQ does not care about the payload -
  # we will be using JSON-encoded strings
  def self.evaluate(competition)
    # grab the fanout exchange
    q = channel.queue("competition.evaluate", :durable => true)
    p "INSIDE EvaluationMessenger.evaluate()"


    # and simply publish message
    q.publish(competition.to_json)
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  # We are using default settings here
  # The `Bunny.new(...)` is a place to
  # put any specific RabbitMQ settings
  # like host or port
  def self.connection
    @connection ||= Bunny.new.tap do |c|
      c.start
    end
  end
end