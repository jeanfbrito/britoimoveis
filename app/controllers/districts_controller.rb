class DistrictsController < InheritedResources::Base
  respond_to :json 
before_filter :find_city

  def find_city
      @city = City.find(params[:city_id])
  end

  def index
    @districts = @city.districts.order("name").used
    #render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
    render :json => @districts.to_json
  end

end