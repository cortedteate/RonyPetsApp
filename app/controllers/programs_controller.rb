class ProgramsController < ApplicationController
  before_action :set_pets, only: [:index, :new, :create, :edit, :update, :destroy, :new_program]
  before_action :set_frecuencies, only: [:index, :new, :create, :edit, :update, :destroy, :new_program]

  def index
    current_user.admin? ? @programs = Program.all.order(:id) : @programs = Program.where(user_id: current_user.id)
  end

  def new
    @program = Program.new
    @program.pet_id = params[:pet_id]
  end

  def edit
  end

  def create
    @program = Program.new(program_params)
    @program.product_id = @program.pet.product_id
    @program.quantity_id = Quantity.where(size_id: @program.pet.size_id, phase: @program.pet.phase).pluck(:id).first
    @program.user_id = @program.pet.user_id
    
    respond_to do |format|
      if @program.save 
        format.json { head :no_content }
        format.js
      else 
        format.json { render json: @program.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @program.update(program_params) 
        format.json { head :no_content }
        format.js
      else 
        format.json { render json: @program.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @program.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  def new_program
    @program = Program.new
    @program.pet_id = params[:pet_id]
    @program.frecuency_id = params[:frecuency_id] 
  end

  private

  def set_pets
    @pets = Pet.where(user_id: current_user.id)
  end

  def set_frecuencies
    @frecuencies = Frecuency.all
  end

  def program_params
    params.require(:program).permit(:pet_id, :product_id, :quantity_id, :frecuency_id, :user_id, :initial_date)
  end

end
