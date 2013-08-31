require_relative 'controller.rb'
require 'sinatra'

get '/' do
  generator=ProductQuery.new
  erb :index, :locals => {:products_array => generator.index}
end

get '/expensive/' do
  generator=ProductQuery.new
  erb :index, :locals => {:products_array => generator.index("expensive")}
end

get '/cheap/' do
  generator=ProductQuery.new
  erb :index, :locals => {:products_array => generator.index("cheap")}
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

get "/stores/:postal_code" do
  generator=StoreQuery.new
  erb :stores, :locals => {:stores => generator.nearby(params[:postal_code]) }
end

get"/beercollage" do
  generator=ProductQuery.new
  erb :image, :locals => {:products_array => generator.collage}
end