class WeathersController < ApplicationController
  def index
    if params[:city] && params[:country]
      city = City.new(
        name: params[:city],
        country: params[:country]
      )

      @weather = city.find_id.fetch_weather

      unless @weather
        redirect_to weathers_url, notice: city.errors.full_messages
      end
    else
      redirect_to weathers_url, notice: 'please provide city and country'
    end
  end
end