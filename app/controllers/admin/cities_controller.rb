class Admin::CitiesController < InheritedResources::Base
  layout "admin" 

  def create
    create! { admin_cities_url }
  end

    def permitted_params
      params.permit(:city => [:name, :state_id])
    end
  
end