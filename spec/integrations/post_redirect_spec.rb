require 'rails_helper'

RSpec.describe 'Post redirect:', type: :feature do
  before(:each) do
    visit new_user_session_path
  end

  it 'click on see all and redirects me' do
    user = User.create!(name: 'Great', email: 'great8@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3, role: 'admin')

    fill_in 'blog', with: 'great8@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit user_posts_path(user.id)
    click_on "view#{user.id}"

    expect(page).to have_current_path(user_posts_path(user.id))
  end

  it 'see redirect click user post show' do
    user = User.create!(name: 'Great', email: 'great8@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3)
    fill_in 'blog', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    post = Post.create!(title: 'Real stressed', text: 'Price', comments_counter: 4, likes_counter: 9,
                        user_id: user.id)

    visit user_posts_path(user.id)

    click_link(post.title.to_s)

    expect(page).to have_current_path(user_post_path(user.id, post.id))
  end
end
