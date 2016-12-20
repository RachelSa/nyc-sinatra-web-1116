class FiguresController < ApplicationController

  get '/figures' do 
    @figures = figure.all
    erb :'/figures/index'
  end



  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id/edit' do
    @figure = figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = figure.create(params[:figure])
    redirect to "/figures/#{@figure.id}"
  end

  delete '/figures/:id/delete' do
    @figure = figure.find(params[:id])
    @figure.destroy
    redirect to '/figures'
  end

  patch '/figures/:id' do
    @figure = figure.find(params[:id])
    @figure.update(params[:figure])
    redirect to "/figures/#{@figure.id}"
  end

    get '/figures/:id' do 
    @figure = figure.find(params[:id])
    erb :'/figures/show'
  end

end