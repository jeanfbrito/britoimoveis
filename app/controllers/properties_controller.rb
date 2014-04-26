class PropertiesController < ApplicationController

  def index
    @properties = Property.where(nil).page(params[:page]) # creates an anonymous scope
    if params[:search]   
      if params[:search][:city_id].present?
        city = City.find(params[:search][:city_id]) #porque diabos nao funciona com where? city = City.where(id: params[:search][:city_id]) #porque diabos nao funciona com where?
        @properties = city.properties.page(params[:page])
        @properties = @properties.district_id(params[:search][:district_id]) if params[:search][:district_id].present?
      end
      @properties = @properties.bedrooms(params[:search][:bedrooms]) if params[:search][:bedrooms].present?
      @properties = @properties.garages(params[:search][:garages]) if params[:search][:garages].present?
      @properties = @properties.property_type_id(params[:search][:property_type_id]) if params[:search][:property_type_id].present?
    end
  end

  def show
    @property = Property.find(params[:id])
    @pictures = @property.pictures.order("position")

    respond_to do |format|
      format.html #{ render :layout => false if request.xhr? }
      #format.xml  { render :xml => @property }
      #format.json { render json: @property }
    end
  end

  
end