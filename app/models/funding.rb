class Funding < ApplicationRecord
  belongs_to :project
  belongs_to :investor, :class_name => 'User'
end
