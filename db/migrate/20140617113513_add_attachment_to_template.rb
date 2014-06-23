class AddAttachmentToTemplate < ActiveRecord::Migration
  def change
    add_attachment :templates, :snapshot
  end
end
