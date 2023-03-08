require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'show page' do
    it 'shows the user profile picture' do
      visit user_path('1')
      expect(page).to have_selector('img')
    end

    it 'shows the username of the user' do
      visit user_path('1')
      expect(page).to have_content('Wassim Chakib')
    end

    it 'shows the number of posts the user has written' do
      visit user_path('1')
      expect(page).to have_content('Number of posts: 3')
    end

    it 'shows the user bio' do
      visit user_path('1')
      expect(page).to have_content('Bio')
    end

    it 'shows the user first 3 posts' do
      visit user_path('1')
      expect(page).to have_selector('.post', count: 3)
    end

    it 'has a button to see all users posts' do
      visit user_path('1')
      expect(page).to have_content('See all posts')
    end

    it 'redirects to post show page when clicking on user post' do
      visit user_path('1')
      click_link 'Post #1'
      expect(page).to have_content('Post #1 by Wassim Chakib')
    end

    it 'redirects to post index page when clicking on the button all posts' do
      visit user_path('1')
      click_link 'See all posts'
      expect(page).to have_current_path('/users/1/posts')
    end
  end
end
