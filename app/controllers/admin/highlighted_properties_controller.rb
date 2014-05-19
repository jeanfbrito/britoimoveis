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
  def create
    #binding.pry
    @highlight = HighlightedProperty.create params.require(:highlighted_property).permit(:property_id)
    @property = @highlight.property
    render :toggle
  end
  def destroy
    highlight = HighlightedProperty.find(params[:id]).destroy
    @property = highlight.property
    
    # @highlighted_property = HighlightedProperty.find(params[:id])
    # @highlighted_property.destroy
    # # @photo.destroy
    # #flash[:success] = "Photo successfully deleted."
    respond_to do |format|
      #format.json { render json: nil, status: :ok }
      format.js { render :toggle }
    end

    #   if @highlighted_property.destroy
    #     render json: nil, status: :ok
    #   end
    #end
        #format.js
        #render nothing: true
        # format.json { render json: @photo, status: :created, location: @photo}
        # redirect_to user_album_path(@user, @album)
      #end
    #end
  end
end