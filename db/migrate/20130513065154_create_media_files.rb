class CreateMediaFiles < ActiveRecord::Migration
  def change
    create_table :media_files do |t|
      t.string :name
      t.string :path
      t.string :ftype
      t.string :feature

      t.timestamps
    end
  end
end
