require 'rails_helper'

RSpec.describe 'Recipes#index', type: :system do
  before do
    driven_by(:rack_test)

    login_as(create(:user))

    visit recipes_path
  end

  it 'has a header for the list' do
    expect(page).to have_content('All recipes')
  end

  it 'has a content New recipe' do
    expect(page).to have_content('New recipe')
  end
end
