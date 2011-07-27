class TransactionAtom < ActiveRecord::Base
  belongs_to :account
  has_many :transaction_parts

  def amount
    transaction_parts.collect { |tp| tp.amount }.inject(0) { |sum, amount| sum + amount }
  end

  def new_part category, amount
    case category
      when Symbol
        category = TransactionCategory.find_or_create_by_name(category.to_s)
      when String
        category = TransactionCategory.find_or_create_by_name(category)
      when TransactionCategory
      else
        raise 'category must be a symbol, a string or a TransactionCategory'
    end


    case amount
      when String
        amount = Float(amount)
      when Float
      else
        raise 'amount must be a numeric string or a float'
    end

    tp = TransactionPart.new :transaction_atom_id => self.id, :transaction_category_id => category.id, :amount => amount
    if block_given?
      tp.save!
      yield tp
    end
    tp.save!
    reload
  end
end
