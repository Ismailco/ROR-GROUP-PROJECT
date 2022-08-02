require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  before do
    driven_by(:rack_test)

    login_as(create(:user))

    visit general_shopping_list_path
  end

  it 'has a header for the list' do
    expect(page).to have_content ('Shopping List')
  end

  it 'has a table with the list of foods' do
    expect(page).to have_selector('table')
  end

  it 'has the correct columns in the table' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Price')
  end

  # it 'has a button to add a food' do
  #   expect(page).to have_button('Add food')
  # end

  # it 'has a button to remove a food' do
  #   expect(page).to have_button('Remove')
  # end

  # it 'can add a food to the shopping list' do
  #   fill_in 'food_name', with: 'Pizza'
  #   fill_in 'food_quantity', with: '1'
  #   fill_in 'food_unit', with: 'piece'
  #   click_button 'Add'

  #   expect(page).to have_content('Pizza')
  # end

  #   it 'can delete a food from the shopping list' do
  #   fill_in 'food_name', with: 'Pizza'
  #   fill_in 'food_quantity', with: '1'
  #   fill_in 'food_unit', with: 'piece'
  #   click_button 'Add'

  #   click_link 'Pizza'
  #   click_link 'Delete'

  #   expect(page).to_not have_content('Pizza')
  # end
end
