class PlansController < ApplicationController

  def index
    current_user.admin? ? @plans = Plan.all.order(:id) : @plans = Plan.where(user_id: current_user.id).order(:id)
  end

  def new
    @plan = Plan.new
  end

  def new_from_program
    @plan = Plan.new
    @plan.user_id = params[:program_id]
  end

  def create
    @plan = Pet.new(pet_params)

    respond_to do |format|
        if @plan.save 
          format.json { head :no_content }
          format.js
        else 
          format.json { render json: @plan.errors.full_messages, status: :unprocessable_entity }
          format.js { render :new }
        end
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:user_id, :product_id, :pet_id, :frecuency_id, :quantity_id, :initial_date, :delivered_date, :program_id)
  end

end
