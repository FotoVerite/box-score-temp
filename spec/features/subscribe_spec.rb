require 'spec_helper'

feature 'subscribing to the post email list' do
  scenario 'subscribing' do
    visit root_path

    VCR.use_cassette('mailchimp-valid-email') do
      fill_in 'email', with: 'validemail@email.com'
      click_on 'Subscribe'
    end

    expect(page).to have_content 'Subscription email has been sent to validemail@email.com'
  end

  scenario 'subscribing with an invalid email' do
    visit root_path

    VCR.use_cassette('mailchimp-invalid-email') do
      fill_in 'email', with: 'user@example.com'
      click_on 'Subscribe'
    end

    expect(page).to have_content 'This email address looks fake or invalid.'
  end
end
