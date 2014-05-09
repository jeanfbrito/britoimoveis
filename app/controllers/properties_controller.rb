class PropertiesController < ApplicationController

  SERCH_MIN_VALUE = '0'
  SERCH_MAX_VALUE = '350000'

  def index
    @properties = Property.where(nil).page(params[:page]) # creates an anonymous scope
    if params[:search]   
      if params[:search][:city_id].present?
        city = City.find(params[:search][:city_id]) #porque diabos nao funciona com where? city = City.where(id: params[:search][:city_id]) #porque diabos nao funciona com where?
        @properties = city.properties.page(params[:page])
        @properties = @properties.district_id(params[:search][:district_id]) if params[:search][:district_id].present?
      end
      unless params[:search][:value_max] == SERCH_MIN_VALUE
        @properties = @properties.where("sell_price >= #{params[:search][:value_min]}") if params[:search][:value_min].present?
      end
      unless params[:search][:value_max] == SERCH_MAX_VALUE
        @properties = @properties.where("sell_price <= #{params[:search][:value_max]}") if params[:search][:value_max].present?
      end
      #@properties = @properties.where(:sell_price >= params[:search][:value_max]) if params[:search][:value_max].present?
      @properties = @properties.bedrooms(params[:search][:bedrooms]) if params[:search][:bedrooms].present?
      @properties = @properties.garages(params[:search][:garages]) if params[:search][:garages].present?
      @properties = @properties.property_type_id(params[:search][:property_type_id]) if params[:search][:property_type_id].present?
    end
    if params[:search_code]
      @properties = @properties.id(params[:search_code][:reference_code]) if params[:search_code][:reference_code].present?
    end
    @properties = @properties.order("id")
    @properties = @properties.order(params[:sort]+ " " + params[:direction]) if params[:sort].present?
  end

  def show
    @contact_message = ContactMessage.new

    @property = Property.find(params[:id])
    @pictures = @property.pictures.order("position")

    respond_to do |format|
      format.html #{ render :layout => false if request.xhr? }
      #format.xml  { render :xml => @property }
      #format.json { render json: @property }
    end
  end

  
end