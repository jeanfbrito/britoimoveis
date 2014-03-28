class Admin::PropertiesController < InheritedResources::Base
	layout "admin" 

  def index
    @properties = Property.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @property = Property.new

    respond_to do |format|
      format.html { render :layout => !request.xhr? }
      format.json { render json: @property }
    end
  end

  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to edit_admin_property_path(@property), notice: 'Property was successfully created.' }
        format.json { render json: @property, status: :created, location: @property }
      else
        format.html { render action: "new" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @property = Property.find(params[:id])
    render :layout => !request.xhr?
  end

  def update
    @property = Property.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(property_params)
        format.html { redirect_to edit_admin_property_path(@property), notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def pictures_upload
    respond_to do |format|
      format.html { render :layout => !request.xhr? }
      format.json { render json: @property }
    end
  end

  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def property_params
      params.require(:property).permit( :address_name, 
                                        :address_number,
                                        :address_complement,
                                        :address_reference,
                                        :district_id,
                                        :privative_area,
                                        :constructed_area,
                                        :total_area,
                                        :terrain_area,
                                        :description,
                                        :bedrooms,
                                        :suits,
                                        :bathrooms,
                                        :garages,
                                        :furnished,
                                        :construction_year,
                                        :sell_price,
                                        :client_price,
                                        :property_type_id,
                                        :business_type_id)
    end

end