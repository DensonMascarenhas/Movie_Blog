class MoviesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
        @movie=Movie.new
    end

    def index
        @movie=Movie.find(params[:id])
        #niharika pagal hai
    end

    def show
    end

    def create
        @movie=Movie.new(get_params)
        if @movie.save
            flash[:notice]="Saved successfully"
            redirect_to @movie
        else
            render :new, status: :unprocessable_entity 
        end
    end

    private

    def get_params
        params.require(:movie).permit(:name, :year, :tag_list)
    end
end
