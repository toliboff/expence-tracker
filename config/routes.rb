Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'splash_screen#index'
   
   resources :splash_screen, only: %i[index]
   resources :users, only: %i[index show] do 
    resources :groups do
       resources :entities
    end   
    end
end
