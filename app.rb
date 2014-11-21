$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'bundler'
Bundler.require :default, (ENV["RACK_ENV"] || "development").to_sym

set :root_domain, (ENV['ROOT_DOMAIN'] || "inanipad.dev")

get "*" do
  @host = request.host.gsub(/\.#{settings.root_domain}/, '')
  @host = "fancyrabbit.co" if !@host.match(/\./)
  @path = request.path
  @iframe_src = "http://#{@host}#{@path}"
  erb :index
end