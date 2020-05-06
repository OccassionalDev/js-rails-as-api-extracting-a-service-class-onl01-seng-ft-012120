class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: sightings.to_json(:include => {
      :bird => {:only => [:name, :species]},
      :location => {:only => [:latitude, :longitude]}
    }, :except => [:updated_at])
  end
    
  def show
      @sighting = Sighting.find(params[:id])
      render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
  end
end
