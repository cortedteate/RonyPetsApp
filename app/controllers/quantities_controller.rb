class QuantitiesController < ApplicationController
  before_action :set_quantity, only: [:edit, :update, :destroy]
  before_action :set_sizes, only: [:new, :edit]
  
  def index
    @quantities = Quantity.all.order(:id)
  end

  def new
    @quantity = Quantity.new 
  end

  def edit
  end

  def create
    @quantity = Quantity.new(quantity_params)

    respond_to do |format|
      if @quantity.save 
        format.json { head :no_content }
        format.js
      else 
        format.json { render json: @quantity.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @quantity.update(quantity_params) 
        format.json { head :no_content }
        format.js
      else 
        format.json { render json: @quantity.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @quantity.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end


  private

  def quantity_params
    params.require(:quantity).permit(:size_id, :phase, :age, :quantity)
  end

  def set_quantity
    @quantity = Quantity.find(params[:id])
  end

  def set_sizes
    @sizes = Size.all
  end
end
