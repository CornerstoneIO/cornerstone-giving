class CreateWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :websites do |t|
      t.string :title
      t.boolean :contact_us
      t.boolean :beliefs
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
