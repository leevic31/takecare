class Hold < ApplicationRecord
  # Associations
  belongs_to :booking
  # Validations
  validates :expires_at, presence: true
  # Callbacks
  after_destroy :cancel_background_jobs

  private

  def cancel_background_jobs
    # Note: can get handler info like this: Delayed::Job.first.handler
    # The queue is correct, just need to get correct handler

    # Build the pattern to match the serialized job_data
    pattern = "HoldDestroyJob%_aj_globalid: gid://takecare/Hold/#{self.id}%"

    # Find all Delayed Job instances matching the pattern
    Delayed::Job.where(queue: 'default').where("handler LIKE ?", "%#{pattern}%").destroy_all
  end
end
