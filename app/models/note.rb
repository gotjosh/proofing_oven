class Note < ActiveRecord::Base
  belongs_to :candidate
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags
end
