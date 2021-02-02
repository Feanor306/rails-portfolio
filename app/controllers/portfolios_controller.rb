class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

	def angular
		@portfolio_items_angular = Portfolio.angular
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

  	def edit
  		@portfolio = Portfolio.find(params[:id])
  	end

  	def update
	  	@portfolio = Portfolio.find(params[:id])

	    respond_to do |format|
	      if @portfolio.update(params.require(:portfolio).permit(:title,:subtitle,:body))
	        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
	      else
	        format.html { render :edit, status: :unprocessable_entity }
	      end
	    end
	end
    
    def show
    	@portfolio = Portfolio.find(params[:id])
    end

    def destroy
    	# Find item
    	@portfolio = Portfolio.find(params[:id])
    	# Destroy item in DB
    	@portfolio.destroy
    	# Redirect
	    respond_to do |format|
	    	format.html { redirect_to portfolios_path, notice: "Portfolio was successfully destroyed." }
	    end
    end
end
