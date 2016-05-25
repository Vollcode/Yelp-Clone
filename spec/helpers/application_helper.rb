# require 'rails_helper'

module ApplicationHelper
  def sign_up
    visit '/restaurants'
    click_link 'Sign up'
    fill_in 'Email', with: 'Alex@alex.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
  end
end
