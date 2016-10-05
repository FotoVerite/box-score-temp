require 'rails_helper'

feature 'Signing in and out' do
  let(:admin) do
    create(
      :admin,
      email: 'admin@example.com',
      password: 'testing',
      sign_in_count: 1
    )
  end

  scenario 'signing in for the first time' do
    @admin = create(
      :admin,
      email: 'admin@example.com',
      password: 'testing',
      sign_in_count: 0
    )

    visit root_path
    click_on 'main-sign-in'

    fill_in('Email', with: 'admin@example.com')
    fill_in('Password', with: 'testing')
    click_button('Login')

    expect(page.current_path).to eq edit_account_path
    expect(page).to have_link 'Sign Out'
  end

  scenario 'Signing in subsequent times' do
    visit root_path
    click_on 'main-sign-in'

    fill_in('Email', with: admin.email)
    fill_in('Password', with: admin.password)
    click_button('Login')

    expect(page.current_path).to eq school_path(admin.school)
    expect(page).to have_link 'Sign Out'
  end

  scenario 'Signing Out' do
    login_as(admin)

    visit root_path

    expect(page).to have_link 'Sign Out'
  end
end
