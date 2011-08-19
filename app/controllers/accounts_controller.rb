class AccountsController < ApplicationController
  # GET /accounts
  def index
    @accounts = Account.all
    @total = @accounts.collect { |a| a.balance }.inject(0, :+)
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1
  def show
    @account = Account.find(params[:id])

    redirect_to account_transaction_atoms_path(@account)
  end
end
