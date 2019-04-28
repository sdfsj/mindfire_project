class HomeController < ApplicationController
#require 'spreadsheet'
  def home_page
  	 @data = ProductsSupplier.products_group_by_supplier
  	 render template: "home_page"
  end

  def import
  	ProductsSupplier.connection.truncate(ProductsSupplier.table_name)
    ProductsSupplier.import(params[:file])
   redirect_to ''
  end

  def supplier_products
  	@supplier_id = params[:supplier_id]
    @supplier_name = params[:supplier_name]
  	if params[:inactive] == "true"
  		@datas = ProductsSupplier.supplier_details_products(@supplier_id.to_i,true)	
  	else
  		@datas = ProductsSupplier.supplier_details_products(@supplier_id.to_i)
  	end

    if request.xhr?
      render partial: "shared/supplier_page.js.erb",:layout=>false
    else
      render template: "supplier_page"
    end

  end
end
