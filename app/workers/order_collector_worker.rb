class OrderCollectorWorker
  include Sidekiq::Worker
  sidekiq_options retry: 1, backtrace: true

  def perform
    status = true
    log = RakeLog.create(title: "Order Collector Week: #{Date.today.cweek} of year #{Date.today.year}")
    begin
      Subscription.bulk_generate_orders
      setting = Setting.last
      setting.update(cut_off_at: setting.cut_off_at.next_week)
    rescue Exception => e
      status = false
      message = e
    end
    log.update_attributes(status: status, message: message)
  end
end
