class Project < ApplicationRecord
  CATEGORIES = ["Eliminate Poverty", "Erase Hunger", "Establish Good Health and Well-Being", "Provide Quality Education", "Enforce Gender Equality", "Improve Clean Water and Sanitation", "Grow Affordable and Clean Energy", "Create Decent Work and Economic Growth", "Increase Industry, Innovation, and Infrastructure", "Reduce Inequality", "Mobilize Sustainable Cities and Communities", "Influence Responsible Consumption and Production", "Organize Climate Action", "Develop Life Below Water", "Advance Life On Land", "Guarantee Peace, Justice, and Strong Institutions", "Build Partnerships for the Goals"] 

  belongs_to :owner, :class_name => 'User'
  has_many :fundings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :name, :category, :total_funding, :total_shares, :owner_id, presence: true
  validates :name, uniqueness: true
  validates :category, inclusion: { in: CATEGORIES }

  def open?
    open
  end

  def self.categories
    CATEGORIES.sort
  end
end

# :foreign_key => 'owner_id', :class_name => 'User'
