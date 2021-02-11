class PortfoliosController < ApplicationController
	before_action :set_portfolio, only: [:edit, :update, :show, :destroy]
	layout "portfolio"

	def index
		@portfolios = Portfolio.all
	end

	def angular
		@portfolios_angular = Portfolio.angular
	end

	def new
		@portfolio = Portfolio.new
		3.times { @portfolio.technologies.build }
	end

	def create
	    @portfolio = Portfolio.new(portfolio_params)

	    respond_to do |format|
	      if @portfolio.save
	        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
	      else
	        format.html { render :new, status: :unprocessable_entity }
	      end
	    end
  	end

  	def edit
  	end

  	def update
	    respond_to do |format|
	      if @portfolio.update(portfolio_params)
	        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
	      else
	        format.html { render :edit, status: :unprocessable_entity }
	      end
	    end
	end
    
    def show
    end

    def destroy
    	# Destroy item in DB
    	@portfolio.destroy
    	# Redirect
	    respond_to do |format|
	    	format.html { redirect_to portfolios_path, notice: "Portfolio was successfully destroyed." }
	    end
    end

    private 

    def portfolio_params
    	params.require(:portfolio).permit(
    		:title,
    		:subtitle,
    		:body, 
	    	technologies_attributes: [:name])
    end

    def set_portfolio
    	@portfolio = Portfolio.find(params[:id])
    end
end
