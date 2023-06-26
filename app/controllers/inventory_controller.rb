class InventoryController < ApplicationController
  def index
    @pets = Pet.all.order(:id)
  end
end
