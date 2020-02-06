Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do
      resources :accounts do 
        resources :transactions
      end 
    end 
  end 

end
#fetch to localhost:3000/api/vi/accounts or /accounts/:id and /accounts/:id/transactions 