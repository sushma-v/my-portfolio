class PortfoliosController < ApplicationController
	before_action :set_portolio_item, only: [:edit, :update, :show, :destroy]
	layout "portfolio"

	def index
		@portfolio_items = Portfolio.all
	end

	def angular
		@angular_portfolio_items = Portfolio.angular
	end

	def new
		@portfolio_item = Portfolio.new
		3.times { @portfolio_item.technologies.build }
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)

	    respond_to do |format|
	      if @portfolio_item.save
	        format.html { redirect_to portfolios_path, notice: "Portfolio item is now live." }
	      else
	        format.html { render :new, status: :unprocessable_entity }
	      end
	    end
	end

	def edit
	end

	def update
		respond_to do |format|
	      if @portfolio_item.update(portfolio_params)
	        format.html { redirect_to portfolios_path, notice: "Portfolio item was successfully updated." }
	      else
	        format.html { render :edit, status: :unprocessable_entity }
	      end
	    end
	end

	def show
	end

	def destroy
		@portfolio_item.destroy
	    respond_to do |format|
	      format.html { redirect_to portfolios_url, notice: "Portfolio item was successfully destroyed." }
	    end
	end

	private

	def portfolio_params
		params.require(:portfolio).permit(:title, 
										  :subtitle, 
										  :body, 
										  technologies_attributes: [:name])
	end

	def set_portolio_item
		@portfolio_item = Portfolio.friendly.find(params[:id])
	end

end
