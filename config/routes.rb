Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :courses
  root to: 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
