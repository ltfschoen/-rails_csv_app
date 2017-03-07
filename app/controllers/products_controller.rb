class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def import
    # Validate inputs with block
    begin
      file = params[:file]
      file_path = file.path
      Product.import(file_path)
      redirect_to root_url, notice: "Products imported."
    rescue
      redirect_to root_url, notice: "Invalid CSV file format."
    end
  end
end
