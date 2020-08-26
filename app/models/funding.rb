class Funding < ApplicationRecord
  belongs_to :project
  belongs_to :investor, :class_name => 'User'

  validates :funding_shares, inclusion: { in: (1..100)}

  def accepted?
    accepted
  end
end
