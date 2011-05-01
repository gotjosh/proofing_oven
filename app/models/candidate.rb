class Candidate
  include Mongoid::Document

  field :first_name
  field :last_name
  field :email
  field :contact_phone
  field :github_id
  field :twitter_id
  field :note
  field :skills, type: Array

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def skills=(array)
    write_attribute(:skills, array.select(&:present?))
  end

  def skills
    read_attribute(:skills) || []
  end

end
