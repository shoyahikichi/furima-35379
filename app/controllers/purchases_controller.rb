class PurchasesController < ApplicationController

  def index
    @purchase = PurchaseForm.new
  end

end
