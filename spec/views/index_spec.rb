require 'rails_helper'

RSpec.describe 'Hello world', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Tom')
    end
  end
end
