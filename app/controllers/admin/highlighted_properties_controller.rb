class Admin::HighlightedPropertiesController < InheritedResources::Base
  layout "admin" 
  def sort
    params[:highlighted_properties].each_with_index do |id, index|
       HighlightedProperty.where(id: id).update_all({position: index+1})
    end
    render nothing: true
   end
   def index
    @highlighted_properties = HighlightedProperty.all.order("position")
    #render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
    #render :json => [].to_json
  end
end