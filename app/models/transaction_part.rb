class TransactionPart < ActiveRecord::Base
  belongs_to :transaction_atom
  has_one :transaction_category
end
