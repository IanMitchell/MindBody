class CreateLocationsTags < ActiveRecord::Migration
  def change
    create_table :locations_tags do |t|
      t.integer :location_id, null: false
      t.integer :tag_id, null: false
    end

    add_index :locations_tags, [:location_id, :tag_id], unique: true
  end
end
