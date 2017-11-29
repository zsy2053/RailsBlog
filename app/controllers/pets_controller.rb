class PetsController < ApplicationController
  def new
    @pets = Pet.new
  end

  def create
    #render plain: params[:pet].inspect
    @pets = Pet.new(pet_params)
    @pets.save
    redirect_to pets_show(@pets)
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :description)
    end
end
