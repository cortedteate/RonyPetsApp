class SizesController < ApplicationController

  before_action :set_size, only: [:edit, :update, :destroy]
  
  def index
    @sizes = Size.all.order(:id)
  end

  def new
    @size = Size.new 
  end

  def edit
  end

  def create
    @size = Size.new(size_params)

    respond_to do |format|
      if @size.save 
        format.json { head :no_content }
        format.js
      else 
        format.json { render json: @size.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @size.update(size_params) 
        format.json { head :no_content }
        format.js
      else 
        format.json { render json: @size.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @size.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end


  private

  def size_params
    params.require(:size).permit(:name, :weight)
  end

  def set_size
    @size = Size.find(params[:id])
  end

end
