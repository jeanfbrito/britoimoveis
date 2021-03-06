class ContactMessagesController < ApplicationController

  def new
    @contact_message = ContactMessage.new

    respond_to do |format|
      format.html { render :layout => !request.xhr? }
      format.json { render json: @contact_message }
    end
  end

  def create
    @contact_message = ContactMessage.new params.require(:contact_message).permit(:name, :email, :message, :phone, :city, :property_id)

    if @contact_message.save     
      NotificationsMailer.new_message(@contact_message).deliver
      if params[:contact_message][:property_id].present?
        redirect_to property_path(:id => params[:contact_message][:property_id])#, notice: "Contato realizado com sucesso!"
        flash[:success] = "Contato enviado com sucesso!" 
      else     
        redirect_to(contato_path, :notice => "Seu contato foi enviado com sucesso. Muito obrigado!")
      end
    else
      if params[:contact_message][:property_id].present?
        redirect_to property_path(:id => params[:contact_message][:property_id])#, notice: "Contato realizado com sucesso!"
      else 
        flash[:error] = "Por favor, preencha todos os campos."
        render :new
      end
    end
  end

end