require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  before do
    driven_by(:rack_test)

    login_as(create(:user))

    visit general_shopping_list_path
  end

  it 'has a header for the list' do
    expect(page).to have_content('Shopping List')
  end

  it 'has a table with the list of foods' do
    expect(page).to have_selector('table')
  end

  it 'has the correct columns in the table' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Price')
  end

  it 'has the amout of food items to buy' do
    expect(page).to have_content('Amount of food items to buy:')
    expect(page).to have_content('0')
  end

  it 'has total value of food needed' do
    expect(page).to have_content('Total value of food needed:')
    expect(page).to have_content('$0')
  end
end
