class PetsController < ApplicationController
    before_action :set_pet, only: [:edit, :update, :destroy]
    before_action :set_kinds, only: [:new, :edit, :create, :new_from_client]
    before_action :set_products, only: [:new, :edit, :create, :new_from_client]
    before_action :set_users, only: [:new, :edit, :create, :new_from_client]
    before_action :set_breeds, only: [:new, :edit, :create, :new_from_client]
    before_action :set_quantities, only: [:edit, :create, :new_from_client]

    def index
      current_user.admin? ? @pets = Pet.all.order(:id) : @pets = Pet.where(user_id: current_user.id).order(:id)
    end
    
    def new
      @pet = Pet.new
    end

    def edit
    end
  
    def create
      #No se llena en el form
      @pet = Pet.new(pet_params)
      @pet.size_id = @pet.breed.size_id
      respond_to do |format|
          if @pet.save 
            format.json { head :no_content }
            format.js
          else 
            format.json { render json: @pet.errors.full_messages, status: :unprocessable_entity }
            format.js { render :new }
          end
      end
    end
    
    def update
      @pet.size_id = @pet.breed.size_id

      respond_to do |format|
        if @pet.update(pet_params) 
          format.json { head :no_content }
          format.js
        else 
          format.json { render json: @pet.errors.full_messages, status: :unprocessable_entity }
          format.js { render :edit }
        end
      end
    end
  
    def destroy
      @pet.destroy
      respond_to do |format|
        format.json { head :no_content }
        format.js
      end
    end

    def product
      @product = Product.where(params[:pet_id])
      render json: @product
    end
    
    def phases
      breed = Breed.find(params[:pet_id])
      @phases = Quantity.where(size_id: breed.size_id)
      render json: @phases
    end

    def kinds
      kind = Kind.find(params[:pet_id])
      @breeds = Breed.where(kind_id: kind.id)
      render json: @breeds
    end

    def new_from_client
      @pet = Pet.new
      @pet.user_id = params[:user_id]
    end
  
    private
  
    def set_pet
      @pet = Pet.find(params[:id])
      if @pet.breed_id != nil
        @pet.size_id = @pet.breed.size_id
      end
    end

    def set_products
      @products = Product.all
    end

    def set_breeds
      @breeds = Breed.all
    end

    def set_users
      current_user.admin? ? @users = User.all : @users = User.where(id: current_user.id)
    end

    def set_kinds
      @kinds = Kind.all
    end

    def set_quantities
      @quantities = Quantity.all
    end

    def pet_params
      params.require(:pet).permit(:name, :kind_id, :breed_id, :phase, :duration, :last_purchase, :product_id, :user_id )
    end
    
end