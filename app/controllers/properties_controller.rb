class PropertiesController < ApplicationController
  def index
    @search = Property.search(params[:q])
    @properties = @search.result

    #@properties = Property.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @property = Property.find(params[:id])

    respond_to do |format|
      format.html #{ render :layout => false if request.xhr? }
      #format.xml  { render :xml => @property }
      #format.json { render json: @property }
    end
  end
end