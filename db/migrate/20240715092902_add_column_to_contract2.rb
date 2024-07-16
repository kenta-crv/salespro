class AddColumnToContract2 < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :post_title, :string
    add_column :contracts, :contract_date, :string
    add_column :contracts, :unit_price, :string
    add_column :contracts, :refund, :string 
  end
end
