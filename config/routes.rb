Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions" }



  namespace :admin do
    get "/" => "homes#top"
     resources :students, only: [:index, :show, :edit, :update]do
       resources :tests, only: [:create, :update, :destroy]
       resources :comments, only: [:create, :destroy]
      end
     resources :target_numbers
     resources :subscriptions, only: [:index, :update]

  end

     resources :subscriptions, only: [:new, :create]
    get "subscriptions/thanks"=> "subscriptions#thanks"
    get "search" => "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
