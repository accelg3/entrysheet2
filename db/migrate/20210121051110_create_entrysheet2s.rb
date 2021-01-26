class CreateEntrysheet2s < ActiveRecord::Migration[5.2]
  def change
    create_table :entrysheet2s do |t|
      t.references :user, foreign_key: true
      t.string :company
      t.string :idea
      t.string :industry
      t.string :business
      t.string :esfileup

      t.timestamps
    end
  end
end
