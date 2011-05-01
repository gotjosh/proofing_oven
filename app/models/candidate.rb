class Candidate < ActiveRecord::Base
  scope :search, lambda { |search_term|
    where("first_name LIKE ? OR last_name LIKE ?", *sanitize_name(search_term))
  }

  def self.sanitize_name(name)
    first, last = "%#{split_name(name).first}%", "%#{split_name(name).last}%"
  end

  def last_first
    "#{last_name}, #{first_name}"
  end

  private
  def self.split_name(name)
    name.split(" ")
  end
end
