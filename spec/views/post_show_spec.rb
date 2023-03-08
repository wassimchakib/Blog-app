require 'rails_helper'

RSpec.describe 'Post', type: :system do
  describe 'show page' do
    it 'shows the post title' do
      visit user_post_path(1, 1)
      expect(page).to have_content('Post #1 by Wassim Chakib')
    end

    it 'shows who wrote the post' do
      visit user_posts_path(1, 1)
      expect(page).to have_content('Wassim Chakib')
    end

    it 'shows how many comments it has' do
      visit user_posts_path(1, 1)
      expect(page).to have_content('Comments: ')
    end

    it 'shows how many likes it has' do
      visit user_posts_path(1, 1)
      expect(page).to have_content('Likes: ')
    end

    it 'shows the body of the post' do
      visit user_posts_path(1, 1)
      expect(page).to have_content('Succeed at software development')
    end

    it 'shows the username of each commentor' do
      visit user_posts_path(1, 1)
      expect(page).to have_content('Mert Kaya:')
    end

    it 'shows the comment each commentor left' do
      visit user_posts_path(1, 1)
      expect(page).to have_content('Thank you for publishing this informative blog post.')
    end
  end
end
