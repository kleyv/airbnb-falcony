class CreateFundings < ActiveRecord::Migration[6.0]
  def change
    create_table :fundings do |t|
      t.integer :funding_amount
      t.integer :funding_shares
      t.references :project, null: false, foreign_key: true
      t.references :investor, null: false, foreign_key: { to_table: :users }
      t.boolean :accepted

      t.timestamps
    end
  end
end
