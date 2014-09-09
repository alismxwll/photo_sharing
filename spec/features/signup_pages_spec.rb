require 'rails_helper'

describe "the signup process" do
  it "signs up a user who is creating a new account" do
    visit '/signup'
    fill_in 'Email', :with => 'example@example.com'
    fill_in 'Password', :with => 'example'
    fill_in 'Password confirmation', :with => 'example'
    click_button 'Create User'
    expect(page).to have_content 'Thank you for signing up!'
  end

  it "dosent sign up a user who is creating a new account and inputs wrong pasword" do
    visit '/signup'
    user = User.create(:email => 'thisbetterwork@example.com', :password => 'example')
    fill_in 'Email', :with => 'thisbetterwork@example.com'
    fill_in 'Password', :with => 'exampl'
    click_button 'Create User'
    expect(page).to have_content 'Sign Up'
  end
end
