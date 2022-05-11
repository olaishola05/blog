class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  has_many :posts
  has_many :comments
  has_many :likes

  def recent_posts
    user = User.find(id)
    user.posts.order(created_at: :desc).limit(3)
  end

  Roles = [ :admin , :default, :moderator, :manager ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

end
