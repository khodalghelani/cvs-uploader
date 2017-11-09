class CreateTs < ActiveRecord::Migration[5.1]
  def change
    create_table :ts do |t|
      t.string :title
      t.string :description
      t.string :author
      t.string :tags

      t.timestamps
    end
  end
end
