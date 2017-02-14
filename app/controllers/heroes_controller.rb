class HeroesController < ApplicationController
  def index
    @heroes = Unirest.get("http://localhost:3000/api/v2/heroes.json").body
    
  end

  def show
    @heroes = Unirest.get("http://localhost:3000/api/v2/heroes/.json").body.find_by(id: params[:id])
  end
end
