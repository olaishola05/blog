class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :likes


    def recent_posts
        @user = User.find(params[:id])
        @posts = @user.posts.all.order(created_at: :desc).limit(3)
    end
end


# Comment.create(user_id: User.find(2), post_id: Post.first.id, text: 'Hi Tom!')