require 'rails_helper'

RSpec.describe 'Post', type: :system do
  describe 'index page' do
    it 'shows the user profile picture' do
      visit user_posts_path(1)
      expect(page).to have_selector('img')
    end

    it 'shows the username of the current user' do
      visit user_posts_path(1)
      expect(page).to have_content('Wassim Chakib')
    end

    it 'shows the number of posts the user has written' do
      visit user_posts_path(1)
      expect(page).to have_content('Number of posts: 3')
    end

    it 'shows the post title' do
      visit user_posts_path(1)
      expect(page).to have_content('Post #1')
    end

    it 'shows the post body' do
      visit user_posts_path(1)
      expect(page).to have_content('Succeed at software development')
    end

    it 'shows the first comments on a post' do
      visit user_posts_path(1)
      expect(page).to have_content('Mert Kaya: Thank you for publishing this informative blog post.')
    end

    it 'shows how many comments a post has' do
      visit user_posts_path(1)
      expect(page).to have_content('Comments: 1')
    end

    it 'shows how many likes a post has' do
      visit user_posts_path(1)
      expect(page).to have_content('Likes: 0')
    end

    it 'shows a section for pagination' do
      visit user_posts_path(1)
      expect(page).to have_content('Pagination')
    end

    it 'redirects to post show page when clicked on a post' do
      visit user_posts_path(1)
      click_link 'Post #1'
      expect(page).to have_content('Post #1 by Wassim Chakib')
      expect(page).to have_current_path('/users/1/posts/1')
    end
  end
end
