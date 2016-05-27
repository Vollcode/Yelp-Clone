
module ApplicationHelper
  def sign_up
    visit '/restaurants'
    click_link 'Sign up'
    fill_in 'Email', with: 'Alex@alex.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
  end

  def another_sign_up
    visit '/restaurants'
    click_link 'Sign up'
    fill_in 'Email', with: 'matt@matt.com'
    fill_in 'Password', with: '654321'
    fill_in 'Password confirmation', with: '654321'
    click_button 'Sign up'
  end

  def leave_review(thoughts, rating)
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

end
