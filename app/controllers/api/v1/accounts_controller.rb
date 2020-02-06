class Api::V1::AccountsController < ApplicationController
    before_action :set_account, only: [:show,:destroy]

    def index 
        accounts = Account.all

        render json: accounts
    end 

    def show
        render json: @account
    end 

    def create
        account = Account.new(account_params)

        if account.save
            render json: account
        else 
            render json: {error: 'Error creating account'}
        end 
    end 

    def destroy
        @account.destroy 
    end 

    private

    def set_account
        @account = Account.find_by(id: params[:id])
    end 

    def account_params
        params.require(:account).permit(:name, :balance)     
    end 

end
