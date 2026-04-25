class AddDateToAttendances < ActiveRecord::Migration[8.1]
  def change
    add_column :attendances, :date, :date
  end
end
