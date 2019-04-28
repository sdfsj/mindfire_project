class ProductsSupplier < ApplicationRecord

def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    product = new #find_by_id(row["id"]) || new
    product.attributes = row.to_hash #.slice(*accessible_attributes)
    product.save!
  end
end
def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
end

def self.delete_all
	ProductsSupplier.delete_all
end
def self.products_group_by_supplier
	ProductsSupplier.all.select("supplier_id,supplier_name,sum(is_active) as active,sum(1) as total").group(:supplier_id)
end
def self.supplier_details_products(supplier_id,inactive_flag=false)
	if inactive_flag == true
	  data = ProductsSupplier.where("supplier_id=#{supplier_id}")
    else
	  data = ProductsSupplier.where("supplier_id=#{supplier_id} and is_active=1")
    end
    return data
end
end
