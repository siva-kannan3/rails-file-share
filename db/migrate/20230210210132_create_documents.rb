class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :key
      t.boolean :shared, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
