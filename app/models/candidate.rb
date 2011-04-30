class Candidate
  include Mongoid::Document

  embedded_in :user
  field :first_name
  field :last_name
  field :email
  field :phone
  field :github
  field :twitter
  field :local, :type => Boolean
  field :willing_to_relocate, :type => Boolean
  field :added_on, :type => Date
  field :status

  def name
    [first_name, last_name].join(" ")
  end
end
