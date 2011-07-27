class TransactionCategory < ActiveRecord::Base
  has_many :transaction_part
end
