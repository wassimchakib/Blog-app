require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'index page' do
    it 'shows the username of all users' do
      visit users_path
      expect(page).to have_content('Wassim Chakib')
      expect(page).to have_content('Mert Kaya')
    end

    it 'shows the pictures of all other users' do
      visit users_path
      expect(page).to have_selector('img')
    end

    it 'shows the number of posts of all other users' do
      visit users_path
      expect(page).to have_content('Number of posts: 3')
      expect(page).to have_content('Number of posts: 1')
    end

    it 'redirects to user show page when clicked on a user' do
      visit users_path
      click_link 'Wassim'
      expect(page).to have_content('Bio')
      expect(page).to have_current_path('/users/1')
    end
  end
end
