ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }
  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span "Welcome to the SuperAdmin page for HS Box Scores.
        Choose one of the menu items above to add, update, or delete records."
      end
    end
  end
end
