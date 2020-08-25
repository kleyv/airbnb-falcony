class Project < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  has_many :fundings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :name, :category, :total_funding, :total_share, :owner_id, presence: true
  validates :name, uniqueness: true
end

# :foreign_key => 'owner_id', :class_name => 'User'
