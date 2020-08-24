class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :investor, null: false, foreign_key: { to_table: :users }
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
