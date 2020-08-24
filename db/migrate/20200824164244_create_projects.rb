class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :total_funding
      t.integer :total_share
      t.string :status
      t.string :category
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
