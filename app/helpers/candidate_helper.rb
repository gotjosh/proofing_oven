module CandidateHelper
  
  def boolean_transformer(value)
    if value == true
      "Yes"
    else
      "No"
    end
  end
end