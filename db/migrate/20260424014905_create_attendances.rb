class CreateAttendances < ActiveRecord::Migration[8.1]
  def change
    create_table :attendances do |t|
      t.datetime :time_in
      t.datetime :time_out
      t.float :rendered_hours

      t.timestamps
    end
  end
end
