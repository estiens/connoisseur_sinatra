require_relative 'controller.rb'
require 'sinatra'

get '/' do
  erb :index
end

get '/index' do
  erb :index
end

get '/products/' do
  generator=ProductQuery.new
  erb :products, :locals => {:products_array => generator.products}
end

get '/products/expensive' do
  generator=ProductQuery.new
  erb :products, :locals => {:products_array => generator.products("expensive")}
end

get '/products/cheap' do
  generator=ProductQuery.new
  erb :products, :locals => {:products_array => generator.products("cheap")}
end

get '/products/alcoholic' do
  generator=ProductQuery.new
  erb :products, :locals => {:products_array => generator.products("alcoholic")}
end

get "/show/:id" do
  generator=ProductQuery.new
  erb :show, :locals => {:product => generator.show(params[:id]) }
end

get "/stores/" do
  generator=StoreQuery.new
  erb :stores, :locals => {:stores => generator.locations}
end

get "/stores/biggest" do
  generator=StoreQuery.new
  erb :stores, :locals => {:stores => generator.locations("biggest")}
end

get "/stores/smallest" do
  generator=StoreQuery.new
  erb :stores, :locals => {:stores => generator.locations("smallest")}
end

get "/nearby/:postal_code" do
  generator=StoreQuery.new
  erb :stores, :locals => {:stores => generator.nearby(params[:postal_code]) }
end

get"/beercollage" do
  generator=ProductQuery.new
  erb :image, :locals => {:products_array => generator.collage}
end