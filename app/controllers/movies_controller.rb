class MoviesController < ApplicationController
  before_action :find, only: [:show]

  def index
    @movies = Movie.all
  end

  def show; end

  def new
    @movie = Movie.new
  end

  def create
    @movie = movie.new(movie_params)
  end

  def destroy
    @movie.destroy
  end

  private

  def find
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
