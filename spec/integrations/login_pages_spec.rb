require 'rails_helper'

RSpec.describe 'Login pages', type: :system do
    before do
        driven_by(:rack_test)
    end

    before(:each) { visit new_user_session_path }

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
end