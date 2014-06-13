class ProductsController < ApplicationController
#the index action
#this should list all of our products
#index.html.erb
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  #This should find a particular product
  #show.html.erb
  def show
    #@product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    #save to the database
    #raise pauses program
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Good job! You did it.'
    redirect_to products_path
    else
      flash[:alert] = 'Bad job! You failed.'
    render :new
    end
  end

  def edit
    #@product = Product.find(params[:id])
  end

  def update
    #@product = Product.find(params[:id])
    if @product.update_attributes(product_params)
    redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    #@product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  #define a private method
  #use strong parameters
  def product_params
    #params[:product]
    params.require(:product).permit(:name)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end
