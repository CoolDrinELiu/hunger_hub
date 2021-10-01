# frozen_string_literal: true

module Schedules
  class OrderCollectorJob < ApplicationJob
    def perform
      OrderCollectorWorker.perform_async
    end
  end
end