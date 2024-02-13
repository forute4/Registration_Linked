Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    get resources :students, only: [:index, :show, :edit, :update]
    get resources :targets
    get resources :subscriptions, only: [:index, :update]
    get resources :test, only: [:create, :update], path_names: { create: 'admin_test_new' }
    get resources :comment, only: [:create], path_names: { create: 'admin_comment_new' }
  end

    get resources :subscriptions, only: [:new, :create]
    get "subscriptions/thanks"=> "subscriptions#thanks"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
