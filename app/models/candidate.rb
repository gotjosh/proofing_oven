class Candidate < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name, :email
  
  def name
    [first_name, last_name].join(" ")
  end
  
end
