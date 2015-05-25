class Task < ActiveRecord::Base
  # validates :taskname, uniqueness: true
  belongs_to :list
  def complete!
    self.status = "Completed"
    save
  end
end
