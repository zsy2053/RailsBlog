class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      flash[:notice] = "Pet was successfully posted"
      redirect_to pet_path(@pet)
    else
      render 'new'
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :description)
    end
end
