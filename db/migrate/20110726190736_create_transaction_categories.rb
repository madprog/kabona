class CreateTransactionCategories < ActiveRecord::Migration
  def self.up
    create_table :transaction_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_categories
  end
end
