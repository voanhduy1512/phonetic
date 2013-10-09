class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :text
      t.string :phonetic
      t.timestamps
    end
    add_index :words, :text
  end
end
