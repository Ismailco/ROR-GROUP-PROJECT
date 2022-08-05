require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  before do
    driven_by(:rack_test)

    login_as(create(:user))

    visit foods_path
    click_button 'New food'
    fill_in 'Name of the food', with: 'bananna'
    fill_in 'Measurement Unit. ex: Kg...', with: '100'
    fill_in 'Price $', with: '100'
    fill_in 'Quantity', with: '10'
    click_button 'Add new food'
    visit foods_path
  end

  it 'can create a food' do
    expect(page).to have_content 'bananna'
  end

  it 'can delete a food' do
    click_button 'Delete'
    expect(page).to have_content 'Food was successfully deleted'
  end

  it 'can see a list of foods' do
    click_button 'New food'
    fill_in 'Name of the food', with: 'ananas'
    fill_in 'Measurement Unit. ex: Kg...', with: '100'
    fill_in 'Price $', with: '100'
    fill_in 'Quantity', with: '10'
    click_button 'Add new food'
    visit foods_path

    expect(page).to have_content 'bananna'
    expect(page).to have_content 'ananas'
  end
end
