class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :destroy]
    before_action :set_categories, only: [:new, :edit]
    before_action :set_suppliers, only: [:new, :edit]

    def index
        @products = Product.all.order(:id)
      end
    
      def new
        @product = Product.new 
      end
    
      def edit
      end
    
      def create
        @product = Product.new(product_params)
    
        respond_to do |format|
          if @product.save 
            format.json { head :no_content }
            format.js
          else 
            format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
            format.js { render :new }
          end
        end
      end
    
      def update
        respond_to do |format|
          if @product.update(product_params) 
            format.json { head :no_content }
            format.js
          else 
            format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
            format.js { render :edit }
          end
        end
      end
    
      def destroy
        @product.destroy
        respond_to do |format|
          format.json { head :no_content }
          format.js
        end
      end
    
    
      private
    
      def set_product
        @product = Product.find(params[:id])
      end

      def set_categories
        @categories = Category.all
      end

      def set_suppliers
        @suppliers = Supplier.all
      end
    
      def product_params
        params.require(:product).permit(:name, :description, :existence, :price, :image, :category_id, :supplier_id )
      end
    
end