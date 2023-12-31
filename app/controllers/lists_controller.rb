class ListsController < ApplicationController
  before_action :find, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show; end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def find
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
