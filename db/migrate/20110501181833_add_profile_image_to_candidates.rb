class AddProfileImageToCandidates < ActiveRecord::Migration
  def self.up
    add_column :candidates, :profile_image, :string
  end

  def self.down
    remove_column :candidates, :profile_image
  end
end
