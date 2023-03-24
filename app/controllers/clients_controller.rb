class ClientsController < ApplicationController
    before_action :set_client, only: [:edit, :update, :destroy]
    before_action :set_pets, only: [:index, :edit, :update, :destroy]

    def index
        @clients = Client.all.order(:id)
      end
    
      def new
        @client = Client.new 
      end
    
      def edit
      end
    
      def create
        @client = Client.new(client_params)
    
        respond_to do |format|
          if @client.save 
            format.json { head :no_content }
            format.js
          else 
            format.json { render json: @client.errors.full_messages, status: :unprocessable_entity }
            format.js { render :new }
          end
        end
      end
    
      def update
        respond_to do |format|
          if @client.update(client_params) 
            format.json { head :no_content }
            format.js
          else 
            format.json { render json: @client.errors.full_messages, status: :unprocessable_entity }
            format.js { render :edit }
          end
        end
      end
    
      def destroy
        @client.destroy
        respond_to do |format|
          format.json { head :no_content }
          format.js
        end
      end
    
    
      private
    
      def set_client
        @client = Client.find(params[:id])
      end

      def set_pets
        @pets = Pet.all
      end
    
      def client_params
        params.require(:client).permit(:name, :address, :phone)
      end
    

end