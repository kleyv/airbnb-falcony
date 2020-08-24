class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects_as_owner, :class_name => 'Project', :foreign_key => 'owner_id', dependent: :destroy
  has_many :fundings_as_investor, :class_name => 'Funding', :foreign_key => 'investor_id', dependent: :destroy
  has_many :bookmarks_as_investor, :class_name => 'Bookmark', :foreign_key => 'investor_id', dependent: :destroy

  validates :first_name, :last_name, :username, :email, :role, presence: true
  validates :username, uniqueness: true
end
