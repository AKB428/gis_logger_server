require 'sinatra'
#require 'haml'
#require 'shangrila'
require 'sequel'
require "sinatra/json"


configure do
  # 静的コンテンツ参照のためのパス設定
  set :public, File.dirname(__FILE__) + '/public'

end

get '/gislog' do

  params = JSON.parse request.body.read

  file = File.open('log.csv','a')
  file.puts params[:log]
  file.close

  "OK"

end
