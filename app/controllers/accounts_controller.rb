class AccountsController < ApplicationController
  # GET /accounts
  def index
    @accounts = Account.all
    @total = @accounts.collect { |a| a.balance }.inject(0, :+)
  end
end
