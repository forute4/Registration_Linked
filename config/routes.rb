Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions" }

  authenticate :admin do
    namespace :admin do
      get "/" => "homes#top"
       resources :students, only: [:index, :show, :edit, :update]do
         resources :tests, only: [:create, :update, :destroy]
         resources :comments, only: [:create, :destroy]
        end
       resources :target_numbers
       resources :subscriptions, only: [:index, :update]
       get "search" => "searches#search"
    end
  end

     resources :subscriptions, only: [:new, :create]
    root "subscriptions#top"
    get "subscriptions/thanks"=> "subscriptions#thanks"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
