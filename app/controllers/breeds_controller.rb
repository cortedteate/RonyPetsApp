class BreedsController < ApplicationController

  before_action :set_breed, only: [:edit, :update, :destroy]
  before_action :set_sizes, only: [:new, :edit]
  before_action :set_kinds, only: [:new, :edit]

  def index
    @breeds = Breed.all.order(:id)
  end

  def new
    @breed = Breed.new 
  end

  def edit
  end

  def create
    @breed = Breed.new(breed_params)

    respond_to do |format|
      if @breed.save 
        format.json { head :no_content }
        format.js
      else 
        format.json { render json: @breed.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @breed.update(breed_params) 
        format.json { head :no_content }
        format.js
      else 
        format.json { render json: @breed.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @breed.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private

  def breed_params
    params.require(:breed).permit(:kind_id, :name, :size_id)
  end

  def set_breed
    @breed = Breed.find(params[:id])
  end

  def set_sizes
    @sizes = Size.all
  end

  def set_kinds
    @kinds = Kind.all
  end
end
