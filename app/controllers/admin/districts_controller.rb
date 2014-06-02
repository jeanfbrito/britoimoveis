class Admin::DistrictsController < InheritedResources::Base
  layout "admin" 

  def create
    create! { admin_districts_url }
  end

  def permitted_params
    params.permit(:district => [:name, :city_id, :cep])
  end
  
end