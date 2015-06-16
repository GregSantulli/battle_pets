class EvaluationMessenger

  def self.send_message(competition_id)
    q = channel.queue("competition.evaluate", :durable => true)
    q.publish(competition_id.to_s)
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  def self.connection
    @connection ||= Bunny.new.tap do |c|
      c.start
    end
  end

end