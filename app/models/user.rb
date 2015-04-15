class User < ActiveRecord::Base
  has_secure_password

  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships

  has_many :comments
  has_many :tasks, through: :comments


  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true


  def full_name
    "#{first_name} #{last_name}"
  end

  def self.co_member
    @project.memberships.include?(@users && current_user)
  end
  # def owner?(project)
  #   project.memberships.find_by(role: Membership.roles[:owner], user_id: id)
  # end


end
