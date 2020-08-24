class Bookmark < ApplicationRecord
  belongs_to :investor, :class_name => 'User'
  belongs_to :project
end
