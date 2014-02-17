class ContactMessagesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @contact_message = ContactMessage.new

    respond_to do |format|
      format.html { render :layout => !request.xhr? }
      format.json { render json: @contact_message }
    end
  end

  def create
    @contact_message = ContactMessage.new params.require(:contact_message).permit(:name, :email, :message, :phone, :city)

    if @contact_message.save
      flash[:success] = "Contato realizado com sucesso!"
      redirect_to contact_path()#, notice: "Contato realizado com sucesso!"
    else
      render 'contact_messages/new'
    end
  end

end