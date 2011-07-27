class CreateTransactionParts < ActiveRecord::Migration
  def self.up
    create_table :transaction_parts do |t|
      t.references :transaction_atom
      t.references :transaction_category
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_parts
  end
end
