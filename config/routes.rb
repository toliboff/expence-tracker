Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :users, only: %i[index show] do 
    resources :groups do
       resources :entities
    end   
    end
end
