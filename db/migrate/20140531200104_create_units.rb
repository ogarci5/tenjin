class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :number
      t.string :audio
			t.has_attached_file :audio
      t.references :course, index: true

      t.timestamps
    end
  end
end
