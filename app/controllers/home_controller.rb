class HomeController < ApplicationController
	def index
    #@search = Property.search(params[:q])
    @properties = Property.all
    @banner = Property.last(6)
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end