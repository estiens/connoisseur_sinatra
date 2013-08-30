require 'json'
require 'rest-client'
require 'erb'

class ProductQuery

  def initialize
    @@products_array=[]
  end
  
  def index
    raw_response = RestClient.get("http://lcboapi.com/products?page=1&per_page=100")
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

  def show(product)
    raw_response=RestClient.get("http://lcboapi.com/products/#{product}")
    product = JSON.parse(raw_response)["result"]
    return product
    
    # ERBWriter.write(product, __method__)
  end

end

# class ERBWriter
  
#   def self.write(collection,file)
#   object=collection
#   template_file = File.open("#{file}.html.erb", 'r').read
#   erb = ERB.new(template_file)
#   File.open("public/#{file}.html", 'w+') { |file| file.write(erb.result(binding)) }
#   end

# end

