class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

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

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      flash[:notice] = "Pet was successfully updated"
      redirect_to pet_path(@pet)
    else
      render 'edit'
    end
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :description)
    end
end
