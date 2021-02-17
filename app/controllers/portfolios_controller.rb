class PortfoliosController < ApplicationController
	before_action :set_portfolio, only: [:edit, :update, :show, :destroy]
	layout "portfolio"
	access all: [:show, :index, :angular], 
    	user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, 
    	site_admin: :all

	def index
		@portfolios = Portfolio.by_position
	end

	def sort
		params[:order].each do |key, value|
			Portfolio.find(value[:id]).update(position: value[:position])
		end

		render nothing: true
	end

	def angular
		@portfolios_angular = Portfolio.angular
	end

	def new
		@portfolio = Portfolio.new
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
			:main_image,
			:thumb_image,
	    	technologies_attributes: [:id, :name, :_destroy])
    end

    def set_portfolio
    	@portfolio = Portfolio.find(params[:id])
    end
end
