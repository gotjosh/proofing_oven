class Note
  include Mongoid::Document

  field :comment
  field :added_on, :type => Date

  embedded_in :candidate

  set_callback :save, :before do
    self.added_on ||= Date.today
  end
end
