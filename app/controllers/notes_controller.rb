class NotesController < ApplicationController
  expose(:candidate)
  expose(:note)

  def destroy
    note.destroy
    redirect_to candidate
  end
end
