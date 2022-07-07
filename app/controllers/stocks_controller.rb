class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      @tracked = current_user.stocks
        if @stock
          render 'users/my_portfolio'
        else
          flash[:alert] = "Please enter a valid symbol to search"
          redirect_to my_portfolio_path
        end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end

  def refresh
    stock = Stock.find(params[:id])
    update = Stock.new_lookup(stock.ticker)
    stock.last_price = update.last_price
    stock.save
    redirect_to my_portfolio_path
  end

end