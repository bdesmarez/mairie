class CreateMailingSchedules < ActiveRecord::Migration
  def change
    create_table :mailing_schedules do |t|
      t.string :name
      t.references :template, index: true
      t.references :city_hall, index: true
      t.datetime :date
      t.text :content

      t.timestamps
    end
  end
end
