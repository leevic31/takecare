class HoldDestroyJob < ApplicationJob
    queue_as :default

    def perform(hold)
        hold.destroy if hold.present?
    end
end
