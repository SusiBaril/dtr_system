class AddSlugToAttendance < ActiveRecord::Migration[8.1]
  def change
    add_column :attendances, :slug, :string
    add_index :attendances, :slug, unique: true
  end
end
