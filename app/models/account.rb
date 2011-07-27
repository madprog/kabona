class Account < ActiveRecord::Base
  has_many :transaction_atoms

  def balance
    transaction_atoms.collect { |ta| ta.amount }.inject(0) { |sum, amount| sum + amount }
  end

  def new_transaction(description)
    ta = TransactionAtom.new :account_id => self.id, :description => description
    if block_given?
      ta.save!
      yield ta
    end
    ta.save!
    reload
  end
end
