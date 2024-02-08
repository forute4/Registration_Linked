Rails.application.routes.draw do
  namespace :admin do
    get 'subscriptions/index'
  end
  get 'subscriptions/new'
  get 'applications/new'
  namespace :admin do
    get 'applications/index'
  end
  namespace :admin do
    get 'targets/show'
    get 'targets/edit'
    get 'targets/index'
  end
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
