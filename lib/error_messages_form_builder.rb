class ErrorMessagesFormBuilder < ActionView::Helpers::FormBuilder

  def error_messages
    object.errors.map do |attribute, error|
      "#{attribute.to_s.humanize} #{error}"
    end.join("<br />").html_safe
  end

end
