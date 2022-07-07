class UserStocksController < ApplicationController

  def create
    stock = Stock.check_data(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @data_user = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} was successfully added"
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    userstock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    userstock.destroy
    flash[:notice] = "#{stock.name} was successfully removed"
    redirect_to my_portfolio_path
  end

end
