class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseForm.new(purchase_form_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_form_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :phone_number, :building_name, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
