class AddAttachmentImageCToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :image_c
    end
  end

  def self.down
    remove_attachment :categories, :image_c
  end
end
