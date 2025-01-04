class CreateSubscribers < ActiveRecord::Migration[8.0]
  def change
    create_table :subscribers do |t|
      t.belongs_to :bucket, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
