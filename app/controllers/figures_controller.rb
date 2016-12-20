class FiguresController < ApplicationController

  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end



  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all 
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    #binding.pry
    if !params[:landmark][:name].empty?
      l = Landmark.create(params[:landmark])
      @figure.landmarks << l
      @figure.save
    end
    if !params[:title][:name].empty?
      t = Title.create(params[:title])
      @figure.titles << t
      @figure.save
    end
    #binding.pry
    redirect to "/figures/#{@figure.id}"
  end

  delete '/figures/:id/delete' do
    @figure = Figure.find(params[:id])
    @figure.destroy
    redirect to '/figures'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      l = Landmark.create(params[:landmark])
      @figure.landmarks << l
      @figure.save
    end
    if !params[:title][:name].empty?
      t = Title.create(params[:title])
      @figure.titles << t
      @figure.save
    end
   

    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

end