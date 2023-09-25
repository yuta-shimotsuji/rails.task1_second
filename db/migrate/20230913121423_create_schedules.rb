class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_day
      t.date :last_day
      t.string :all_day

      t.timestamps
    end
  end
end
