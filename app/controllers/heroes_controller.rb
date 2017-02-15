class HeroesController < ApplicationController
  def index
    @heroes = Unirest.get("http://localhost:3000/api/v2/heroes.json",
                          headers:{"Accept" => "application/json", "Authorization" => "Token token=longjohnsilver", "X-User-Email" => "test@test.com"}).body
    
  end

  def show
    @heroes = Unirest.get("http://localhost:3000/api/v2/heroes/#{params[:id]}.json").body

  end

  def new
    
  end

  def edit
    @hero = Unirest.get("http://localhost:3000/api/v2/heroes/#{params[:id]}.json",
                        headers:{"Accept" => "application/json"}).body

  end

  def update
    hero = Unirest.patch("http://localhost:3000/api/v2/heroes/#{params[:id]}.json",
                        headers:{ "Accept" => "application/json" }, 
                        parameters:{ name: params[:name], power: params[:power], bad_guy: params[:bad_guy] }).body
   
   redirect_to "/heroes/#{hero["id"]}"
     
  end

  def create
    hero = Unirest.post("http://localhost:3000/api/v2/heroes.json",
                        headers:{ "Accept" => "application/json" }, 
                        parameters:{ name: params[:name], power: params[:power], bad_guy: params[:bad_guy] }).body
    redirect_to "/heroes/#{hero["id"]}"
    
  end

  def destroy
    hero = Unirest.delete("http://localhost:3000/api/v2/heroes/#{params[:id]}.json",
                        headers:{ "Accept" => "application/json" }, 
                          ).body
    redirect_to "/heroes"
    
  end
end
