class Candidate
  include Mongoid::Document

  STATES = %w(Pending Accepted Rejected)

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

  validates :status, :presence => true

  def name
    [first_name, last_name].join(" ")
  end

  set_callback :save, :before do
    self.added_on ||= Date.today
  end
end
