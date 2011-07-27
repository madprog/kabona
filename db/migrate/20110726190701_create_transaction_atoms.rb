class CreateTransactionAtoms < ActiveRecord::Migration
  def self.up
    create_table :transaction_atoms do |t|
      t.references :account
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_atoms
  end
end
