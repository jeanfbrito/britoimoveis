class PropertiesController < ApplicationController
  #def index
    #@search = Property.search(params[:q])
    #@properties = @search.result
    #@properties = Property.all.page params[:page]

    #@properties = Property.all
    #respond_to do |format|
      #format.html # index.html.erb
    #end
  #end

  def index
    if params[:search][:bedrooms]
      @properties = Property.search(params[:search][:bedrooms], params[:search][:property_type_id]).all
      
    binding.pry
    elsif params[:search_code]
      @properties = Property.search_code(params[:search_code]).page(params[:page])
    else
      @properties = Property.all.page params[:page]
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