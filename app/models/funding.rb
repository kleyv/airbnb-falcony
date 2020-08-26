class Funding < ApplicationRecord
  belongs_to :project
  belongs_to :investor, :class_name => 'User'

  validates :funding_amount, inclusion: { in: (0..100)}
end
