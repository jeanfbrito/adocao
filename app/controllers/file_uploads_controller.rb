class FileUploadsController < ApplicationController
def new
  @animal = Animal.find(params[:animal_id])
end

def create
  @animal = Animal.find(params[:animal_id])
  @animal.pictures.attach(params[:animal][:files])
  redirect_to edit_animal_path(@animal)
end
def destroy
  @animal = Animal.find(params[:animal_id])
  @animal.pictures.find(params[:id]).purge
  redirect_to edit_animal_path(@animal)
end
end
