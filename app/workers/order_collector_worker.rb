class OrderCollectorWorker
  include Sidekiq::Worker
  sidekiq_options retry: 1, backtrace: true

  def perform
    status = true
    log = RakeLog.create(title: "Order Collector Week: #{Date.today.cweek} - #{Date.today.year}")
    begin
      # Todo
    rescue Exception => e
      status = false
      message = e
    end
    log.update_attributes(status: status, message: message)
  end
end
