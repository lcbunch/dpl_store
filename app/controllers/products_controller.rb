class ProductsController < ApplicationController
#the index action
#this should list all of our products
#index.html.erb

  def index
    @products = Product.all
  end

  #This should find a particular product
  #show.html.erb
  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    #save to the database
    #raise pauses program
    @product = Product.new(product_params)
    if @product.save
    redirect_to products_path
    else
    render :new
    end
  end

  private
  #define a private method
  #use strong parameters
  def product_params
    #params[:product]
    params.require(:product).permit(:name)
  end

end
