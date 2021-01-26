class CreateCorrectedentrysheets < ActiveRecord::Migration[5.2]
  def change
    create_table :correctedentrysheets do |t|
      t.string :memo
      t.references :user, foreign_key: true
      t.references :entrysheet2, foreign_key: true
      t.string :correctedesfile

      t.timestamps
    end
  end
end
