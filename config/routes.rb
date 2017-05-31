Rails.application.routes.draw do
  root to: 'welcome#index'
  namespace :api do
    devise_for :users, {
        singular: :user,
        controllers: {
            # passwords: 'devise/passwords',
            registrations: 'api/users',
            sessions: 'api/sessions'
        }
    }
  end
end
