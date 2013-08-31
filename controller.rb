require 'json'
require 'rest-client'
require 'erb'

class ProductQuery

  def initialize
    @@products_array=[]
  end
  
  def index(criteria="normal")
    if criteria == "normal"
    raw_response = RestClient.get("http://lcboapi.com/products?page=1&per_page=100")
    elsif criteria == "expensive"
    raw_response = RestClient.get("http://lcboapi.com/products?page=1&per_page=100&order=price_in_cents.desc")
    elsif criteria == "cheap"
    raw_response = RestClient.get("http://lcboapi.com/products?page=1&per_page=100&order=price_in_cents.asc")
    end

    products = JSON.parse(raw_response)["result"]
      products.each do |product|
        @@products_array<<product
      end

      @@products_array.each do |product|
        puts "#{product["name"]} #{product["id"]}"
      end
      return @@products_array
      # ERBWriter.write(@@products_array, __method__)
  end

def collage
    (1..20).each do |page|
    raw_response = RestClient.get("http://lcboapi.com/products?page=#{page}&per_page=100")
    products = JSON.parse(raw_response)["result"]
      products.each do |product|
        @@products_array<<product
      end
    end    
    return @@products_array
end

  def show(product)
    raw_response=RestClient.get("http://lcboapi.com/products/#{product}")
    product = JSON.parse(raw_response)["result"]
    return product
    
    # ERBWriter.write(product, __method__)
  end
end

class StoreQuery

def locations(criteria="none")
  case criteria
  when "biggest" 
    url = "http://lcboapi.com/stores?order=inventory_volume_in_milliliters.desc"
  when "smallest"
    url = "http://lcboapi.com/stores?order=inventory_volume_in_milliliters.asc"
  when "none"
    url= "http://lcboapi.com/stores?order=id.desc"
  end

  raw_response=RestClient.get(url)
  stores = JSON.parse(raw_response)["result"]
  return stores
end

def nearby(postal_code)
  raw_response=RestClient.get("http://lcboapi.com/stores?geo=#{postal_code}")
  stores = JSON.parse(raw_response)["result"]
  return stores
end
end


