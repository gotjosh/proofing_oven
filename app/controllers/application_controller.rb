class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :html

  default_exposure do |name|
    scope = resource_scope(name)
    if id = params["#{name}_id"] || params[:id]
      resource = scope.find(id)
      resource = resource.first if resource.kind_of?(Enumerator)
      resource.tap do |r|
        r.attributes = params[name] unless request.get? || request.delete?
      end
    else
      scope.send(scope.kind_of?(Array) || scope.respond_to?(:build) ? :build : :new, params[name] || {})
    end
  end

  private

  def resource_scope(name)
    if respond_to?("all_#{name.to_s.pluralize}")
      send("all_#{name.to_s.pluralize}")
    elsif respond_to?(name.to_s.pluralize)
      send(name.to_s.pluralize)
    else
      name.to_s.classify.constantize.all
    end
  end

end
