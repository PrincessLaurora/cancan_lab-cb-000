class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

    def index
      if current_user
      @notes = current_user.readable
    end
    end

    def new
      @note = Note.new
    end

    def create
        @note = Note.create(note_params)
        if logged_in?
          @note.save
          redirect_to '/'
      end
    end

    def edit
    end

    def show
    end

    def update
      if @note.update(note_params)
      redirect_to '/'
      end
    end


    private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end



end
