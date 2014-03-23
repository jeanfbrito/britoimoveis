class HomeController < ApplicationController
	def index
    #@search = Property.search(params[:q])
    #@properties = Property.all
    @banner = Property.first(3)
    @destaques = Property.first(8)
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end