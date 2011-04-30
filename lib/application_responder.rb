class ApplicationResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::CollectionResponder
end
