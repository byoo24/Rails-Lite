class AlbumsController < ApplicationController

    def new
        @album = Album.new(band_id: params[:band_id])
        render :new
    end

    def create
        @album = Album.new(album_params)
        debugger

        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end

    end

    def edit
    end

    def show
        @album = Album.find_by(id: params[:id])
        render :show
    end

    def update
    end

    def destroy
    end

    private

    def album_params
        params.require(:album)
        .permit(:band_id, :title, :year, :live)
    end
end