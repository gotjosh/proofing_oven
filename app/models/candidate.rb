class Candidate < ActiveRecord::Base

  def last_first
    "#{last_name}, #{first_name}"
  end

end
