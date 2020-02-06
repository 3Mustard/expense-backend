class Api::V1::TransactionsController < ApplicationController
    before_action :set_account
    before_action :set_transaction, only: [:show]

    def index 
        render json: @account.transactions
    end 

    def show
       render json: @transaction
    end 

    def create
        transaction = @account.transactions.new(transaction_params)

        if @account.update_balance(transaction) != 'Balance too low'
            transaction.save 
            render json: transaction
        else
            render json: {error: 'Balance too low'}
        end 

    end 

    private

    def set_account
        @account = Account.find_by(id: params[:account_id])
    end 

    def set_transaction 
        @transaction = Transaction.find_by(id: params[:id])
    end 

    def transaction_params
        params.require(:transaction).permit(:account_id,:amount,:date,:description)     
    end 

end
