require 'rails_helper'

RSpec.describe 'Login pages', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) { visit user_session_path }

  context 'Test Login page content' do
    it 'should have a email input field' do
      expect(page).to have_field('Email')
    end

    it 'should have a password input field' do
      expect(page).to have_field('Password')
    end

    it 'should have a login button' do
      expect(page).to have_button('Log in')
    end
  end

  context 'Form Submission' do
    scenario 'if can login without credentials' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_no_content('Signed in successfully')
    end

    scenario 'should throw an error if the input data is incorrect' do
      within 'form' do
        fill_in('Email', with: 'wrong@gmail.com')
        fill_in('Password', with: 'secret')
      end
      click_button('Log in')
      expect(page).to have_no_content('Signed in successfully')
    end

    scenario 'should log in if input data is correct' do
      @user = User.create(name: 'Jane', photo: 'beautifulphoto', bio: 'IT Technician.', email: 'janedoe@mail.com',
                          password: 'password', confirmed_at: Time.now, posts_counter: 0, role: 'admin')
      within 'form' do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
      expect(page).to have_content('Signed in successfully')
    end
  end

  context 'Show usernames of all users' do
    it 'Can see username for all user' do
      user1 = User.create!(name: 'Boy', email: 'jle@gmail.com', confirmed_at: Time.now, password: 'password',
                           password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3)
      user2 = User.create!(name: 'Girly', email: 'le@gmail.com', confirmed_at: Time.now, password: 'password',
                           password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3)

      visit(root_path)
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
    end

    it 'Can see Photo for all user' do
      users = User.all
      users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'Can see Number of Post for all user' do
      users = User.all
      users.each do |user|
        expect(page).to have_content("Number of posts: #{user.posts_counter}")
      end
    end

    it 'redirected to that user show page, when click on a user' do
      user = User.create!(name: 'Jonum', email: 'johnblinks@gmail.com', confirmed_at: Time.now, password: 'password',
                          password_confirmation: 'password', bio: 'okay alright', photo: 'https://photo', posts_counter: 3, role: ' ')

      visit '/'
      click_on user.name
      expect(page).to have_current_path(user_posts_path(user.id))
    end
  end
end
