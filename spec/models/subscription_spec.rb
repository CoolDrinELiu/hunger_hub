# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  let!(:food) { create(:food) }
  let!(:user) { create(:user) }
  let!(:setting) { create(:setting) }
  let(:subscription) { create(:subscription, user_id: user.id, food_id: food.id) }
  describe 'Class Methods' do
    context '#get_start_since' do
      it 'should return the date by the next week of cut off date' do
        expect(Subscription.get_start_since).to eq setting.cut_off_at.next_week.beginning_of_week.to_date
      end

      it 'should return the date by tomorrow' do
        setting.update(cut_off_at: 2.days.since)
        expect(Subscription.get_start_since).to eq Date.tomorrow
      end
    end

    context '#bulk_generate_orders' do
      it 'should generate the order' do
        subscription
        expect do
          Subscription.bulk_generate_orders
        end.to change {Order.count}.by(1)
      end

      it 'should generate an order_with_food record' do
        allow_any_instance_of(Subscription).to receive(:generate_order).and_return(true)
        subscription
        expect do
          Subscription.bulk_generate_orders
        end.to change {OrderWithFood.count}.by(1)
      end

      it 'should generate a bulk category order' do
        Subscription.bulk_generate_orders
        expect(Order.last.category).to eq "bulk"
      end
    end

    describe 'Instance Methods' do
      context '#generate_order' do
        it 'should generate an correct order data' do
          subscription
          expect(Order.last.id).to eq subscription.order_id
        end
      end
    end
  end
end