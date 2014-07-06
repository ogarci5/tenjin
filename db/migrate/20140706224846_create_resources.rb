class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :type
      t.text :information
      t.references :course, index: true

      t.timestamps
    end
  end
end
