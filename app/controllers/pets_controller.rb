class PetsController < ApplicationController
  before_action :set_pet, only: [:edit, :update, :show, :destroy]

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

  end

  def destroy
    @pet.destroy
    flash[:notice] = "Pet was successfully deleted"
    redirect_to pets_path
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      flash[:notice] = "Pet was successfully updated"
      redirect_to pet_path(@pet)
    else
      render 'edit'
    end
  end

  private
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :description)
    end
end
