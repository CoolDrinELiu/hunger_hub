# frozen_string_literal: true

module Schedules
  class RankScoreJob < ApplicationJob
    def perform
      RankScoreWorker.perform_async
    end
  end
end