require 'rails_helper'

RSpec.describe 'User Show:', type: :feature do
  before(:each) do
    visit new_user_session_path
    user = User.create!(name: 'Jonyole', email: 'john105908@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3, role: ' ')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    post = Post.create!(title: 'Price', text: 'Price life alright', comments_counter: 4, likes_counter: 9,
                        user_id: user.id)
    Comment.create!(text: 'Hello here', user_id: user.id, post_id: post.id)

    visit user_posts_path(user.id)
  end

  it 'can see the profile pix of user' do
    visit page.find('#img')[:src]
    expect(page.status_code).to eq 200
  end

  it 'I can see the user username.' do
    expect(page).to have_content('Jonyole')
  end

  it ' number of posts ' do
    expect(page).to have_content('Number of posts')
  end

  it 'can see post title' do
    expect(page).to have_content('Price')
  end

  it 'can see some of the post body' do
    expect(page).to have_content('Price life alright')
  end

  it 'can see first comment of the post' do
    expect(page).to have_content('Hello here')
  end

  it 'can see how many comments a post has' do
    expect(page).to have_content('Comments: 1')
  end

  it 'can see how many likes a post has' do
    expect(page).to have_content('Likes: 9')
  end

  it 'can see a section for pagination if there are more posts than fit on the view.' do
    expect(page).to have_content('Pagination')
  end
end
