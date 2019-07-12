class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

    def index
      @notes = Note.all
    end

    def new
      @note = Note.new
    end

    def create
      if logged_in?
        @note = Note.create(note_params)
        if @note.save
          redirect_to '/'
        end
      end
    end

    def show
      @note = Note.find(params[:id])
    end

    def update
    end

    def destroy
    end

    private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end



end
