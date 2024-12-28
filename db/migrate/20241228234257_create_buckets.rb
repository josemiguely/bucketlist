class CreateBuckets < ActiveRecord::Migration[8.0]
  def change
    create_table :buckets do |t|
      t.string :title
      t.string :description
      t.boolean :completed

      t.timestamps
    end
  end
end
