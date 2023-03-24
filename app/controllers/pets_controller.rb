class PetsController < ApplicationController
    before_action :set_pet, only: [:edit, :update, :destroy]
    before_action :set_products, only: [:new, :edit]
    before_action :set_clients, only: [:new, :edit]

    def index
        @pets = Pet.all.order(:id)
      end
    
      def new
        @pet = Pet.new 
      end
    
      def edit
      end
    
      def create
        @pet = Pet.new(pet_params)
    
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
    
    
      private
    
      def set_pet
        @pet = Pet.find(params[:id])
      end

      def set_products
        @products = Product.all
      end

      def set_clients
        @clients = Client.all
      end
    
      def pet_params
        params.require(:pet).permit(:name, :kind, :breed, :age, :duration, :last_purchase, :product_id, :client_id )
      end
    
end