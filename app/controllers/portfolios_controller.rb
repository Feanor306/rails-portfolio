class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio = Portfolio.new
	end

	def create
	    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title,:subtitle,:body))

	    respond_to do |format|
	      if @portfolio.save
	        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
	      else
	        format.html { render :new, status: :unprocessable_entity }
	      end
	    end
  	end
end
