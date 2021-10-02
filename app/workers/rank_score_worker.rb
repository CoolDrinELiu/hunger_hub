class RankScoreWorker
  include Sidekiq::Worker
  sidekiq_options retry: 1, backtrace: true

  def perform
    status = true
    log = RakeLog.create(title: "Rank score")
    begin
      Food.all.each do |f|
        f.update(rank: Utils::Rank.set_rank_score(f.fav_count, f.created_at))
      end
    rescue Exception => e
      status = false
      message = e
    end
    log.update_attributes(status: status, message: message)
  end
end
