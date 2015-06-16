class EvaluationWorker
  include Sneakers::Worker

  from_queue "competition.evaluate", env: nil

  def work(competition_id)
    competition = Competition.find(competition_id.to_i)
    competition.evaluate
    ack! #let queue know that message was received
  end

end