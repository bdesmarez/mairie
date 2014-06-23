class AddSnapshotToMailingSchedule < ActiveRecord::Migration
  def change
  	add_attachment :mailing_schedules, :snapshot
  end
end
