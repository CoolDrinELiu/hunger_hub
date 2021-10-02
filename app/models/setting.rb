class Setting < ApplicationRecord
  validates :cut_off_at, presence: true

  validate :limit_one

  after_save_commit :set_schedule

  def limit_one
    errors.add(:cut_off_at, "Count exceeded.") if Setting.count > 1
  end

  def set_schedule
    if job_id.present?
      job = Sidekiq::ScheduledSet.new.find_job(job_id)
      job.delete if job.present?
    end
    jid = OrderCollectorWorker.perform_at(cut_off_at)
    update_columns(job_id: jid)
  end
end
