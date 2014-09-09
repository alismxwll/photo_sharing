require 'rails_helper'

describe "the log in process" do
  it "logs in a user" do
    visit '/login'
    user = User.create(:email => 'thisbetterwork@example.com', :password => 'example')
    fill_in 'Email', :with => 'thisbetterwork@example.com'
    fill_in 'Password', :with => 'example'
    click_button 'Log In'
    expect(page).to have_content 'Logged in!'
  end

  it "Fails a log in attempt due to wrong password" do
    visit '/login'
    user = User.create(:email => 'thisbetterwork@example.com', :password => 'example')
    fill_in 'Email', :with => 'thisbetterwork@example.com'
    fill_in 'Password', :with => 'Cowexamples'
    click_button 'Log In'
    expect(page).to have_content 'Email or password is incorrect'
  end
end
