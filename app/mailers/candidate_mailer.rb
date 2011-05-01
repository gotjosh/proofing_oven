class CandidateMailer < ActionMailer::Base
  default(:from => 'hu@hashrocket.com')

  def accept(candidate)
    mail to: candidate.email,
         subject: 'You got the job!',
         body: 'Congratulations'
  end

end
