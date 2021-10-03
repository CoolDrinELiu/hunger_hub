class Subscription < ApplicationRecord
  validates :food_id, :user_id, presence: true

  belongs_to :food, counter_cache: :fav_count
  after_commit :generate_order, on: :create

  scope :unprocessed, -> {where(order_id: nil)}

  def self.get_start_since
    Setting.first.cut_off_at >= Time.now ? Date.tomorrow : Setting.first.cut_off_at.next_week.beginning_of_week.to_date
  end

  def self.bulk_generate_orders
    ApplicationRecord.transaction do
      r = Order.create!(start_since: get_start_since, category: :bulk)
      Subscription.unprocessed.each do |subsc|
        OrderWithFood.create!(food_id: subsc.food_id, qty: subsc.qty, subscription_id: subsc.id)
        subsc.update!(order_id: r.id)
      end
    end
  end
  private

  def generate_order
    if Setting.count == 1
      start_since = Subscription.get_start_since
      ApplicationRecord.transaction do
        r = Order.create!(start_since: start_since, user_id: user_id)
        OrderWithFood.create!(food_id: food_id, qty: qty, subscription_id: id)
        update!(order_id: r.id)
      end
    end
  end
end