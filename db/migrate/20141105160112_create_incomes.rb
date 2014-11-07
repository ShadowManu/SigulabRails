class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      
      t.references :lab
      
      t.float :amount
      t.column :origin, :integer, default: 0
      t.string :description
      t.datetime :date
      t.string :organism
      t.string :document
      t.string :financing
      
      t.timestamps
    end
  end
end
