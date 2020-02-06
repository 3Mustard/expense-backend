Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do
      resources :transactions
      resources :accounts
    end 
  end 

end
#fetch to localhost:3000/api/vi/resource 