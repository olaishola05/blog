require 'rails_helper'

RSpec.describe 'User Show:', type: :feature do
  before(:each) do
    visit new_user_session_path
  end
  it ' it redirects me to that post show page' do
    user = User.create!(name: 'Jonyole', email: 'john1059081@gmail.com', confirmed_at: Time.now,
                        password: 'password', password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3, role: ' ')
    post = Post.create!(title: 'Price', text: 'Price life alright', comments_counter: 4, likes_counter: 9,
                        user_id: user.id)

    fill_in 'blog', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit user_posts_path(user.id)

    # click_on 'Post #1'
    click_on post.title

    expect(page).to have_current_path(user_post_path(user.id, post.id))
  end

  it 'Can see who wrote the post' do
    user = User.create!(name: 'Jonyole', email: 'john1050978@gmail.com', confirmed_at: Time.now,
                        password: 'password', password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3, role: ' ')
    fill_in 'blog', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    post = Post.create!(title: 'Price', text: 'Price life alright', comments_counter: 4, likes_counter: 9,
                        user_id: user.id)
    Comment.create!(text: 'Hello here', user_id: user.id, post_id: post.id)

    visit user_post_path(user.id, post.id)

    expect(page).to have_content('by Jonyole')
  end

  it 'To see comment each commentor left' do
    user = User.create!(name: 'Jonyole', email: 'jonyole@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3, role: ' ')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    post = Post.create!(title: 'Price', text: 'Price life alright life alright life alright', comments_counter: 14,
                        likes_counter: 19, user_id: user.id)

    user2 = User.create!(name: 'Ole', email: 'ole068@gmail.com', confirmed_at: Time.now, password: 'password',
                         password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3, role: ' ')

    user3 = User.create!(name: 'Eve', email: 'Eve8@gmail.com', confirmed_at: Time.now, password: 'password',
                         password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3, role: ' ')

    Comment.create!(text: 'Hello here', user_id: user.id, post_id: post.id)
    Comment.create!(text: 'ole is here', user_id: user2.id, post_id: post.id)
    Comment.create!(text: 'eve passing bye', user_id: user3.id, post_id: post.id)

    visit user_post_path(user.id, post.id)

    expect(page).to have_content('Eve: eve passing bye')
    expect(page).to have_content('Ole: ole is here')
    expect(page).to have_content('Jonyole: Hello here')
  end

  describe 'Post Show' do
    before(:each) do
      visit new_user_session_path
      user = User.create!(name: 'Jonyole', email: 'john105068@gmail.com', confirmed_at: Time.now,
                          password: 'password', password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3, role: ' ')
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      post = Post.create!(title: 'Price', text: 'Price life alright life alright life alright',
                          comments_counter: 14, likes_counter: 19, user_id: user.id)
      Comment.create!(text: 'Hello here', user_id: user.id, post_id: post.id)

      visit user_post_path(user.id, post.id)
    end

    it 'can see the post title.' do
      expect(page).to have_content('Price')
    end

    it 'can see how many comments a post has' do
      expect(page).to have_content('Comments: 1')
    end

    it 'can see how many likes a post has' do
      expect(page).to have_content('Likes: 19')
    end

    it 'can see the post body.' do
      expect(page).to have_content('Price life alright life alright life alright')
    end

    it ' the username of each commentor.' do
      expect(page).to have_content('Jonyole: Hello here')
    end
  end
end
