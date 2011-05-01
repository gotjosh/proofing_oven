class Note
  include Mongoid::Document

  field :comment
  field :added_on, :type => Date

  embedded_in :candidate
end
