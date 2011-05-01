class NotesController < AuthenticatedController
  expose(:notes) { candidate.notes }
  expose(:note)

  def create
    if note.save
      if request.xhr?
        render partial: "candidates/note", locals: { note: note }
      else
        redirect_to candidate
      end
    else
      redirect_to candidate
    end
  end
end
