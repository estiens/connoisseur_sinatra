require_relative 'html_generator.rb'
require 'sinatra'

get '/' do
  generator=ProductQuery.new
  erb :index, :locals => {:products_array => generator.index}
end

get "/show/:id" do
  generator=ProductQuery.new
  erb :show, :locals => {:product => generator.show(params[:id]) }
end