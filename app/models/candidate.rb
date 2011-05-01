class Candidate < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :notes

  def self.available_states
    %w(pending hired rejected)
  end

  def name
    [first_name, last_name].compact.join(" ")
  end

end
