class User < ApplicationRecord
    has_many :posts
    has_many :comments, through: :posts
    has_many :likes, through: :posts


    def recent_posts
        @user = User.find(params[:id])
        @posts = @user.posts.all.order(created_at: :desc).limit(3)
    end
end
