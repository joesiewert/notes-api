class NotesController < ApplicationController

  def index
    notes = Note.all
    render json: notes
  end

  def create
    note = Note.new(note_params)
    note.save
    render json: note
  end

  def show
    note = Note.find(params[:id])
    render json: note
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    render json: note
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    head :no_content
  end

  private
    def note_params
      params.require(:note).permit(:title, :body)
    end
end
