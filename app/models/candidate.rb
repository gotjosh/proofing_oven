class Candidate < ActiveRecord::Base
  
  mount_uploader :profile_image, ProfileUploader
  validates_presence_of :first_name, :last_name, :email
  
  def name
    [first_name, last_name].join(" ")
  end
  
end
