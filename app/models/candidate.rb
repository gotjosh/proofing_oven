class Candidate < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :notes

  def self.filter_by(params)
    build_filter_scope(applicable_filter_params(params))
  end

  scope :filter_by_local, ->(value) { where(local: value == 'true') }
  scope :filter_by_status, ->(value) { where(status: value) }
  scope :filter_by_willing_to_relocate, ->(value) { where(willing_to_relocate: value == 'true') }

  def self.available_states
    %w(pending hired rejected)
  end

  def name
    [first_name, last_name].compact.join(" ")
  end

  private

  def self.applicable_filter_params(params)
    params.select{|k,v| filterable_attributes.include?(k.to_sym) && v.present?}
  end

  def self.filterable_attributes
    [:local, :status, :willing_to_relocate]
  end

  def self.build_filter_scope(params_hash)
    params_hash.inject(scoped{}) { |scope, set| scope.send(:"filter_by_#{set.first}", set.last)}
  end

end
