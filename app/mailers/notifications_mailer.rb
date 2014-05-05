class NotificationsMailer < ActionMailer::Base

  default :from => "contato@britoimoveis.net"
  default :to => "jeanfbrito@gmail.com"

  def new_message(contact_message)
    @contact_message = contact_message
    subject_text = "[britoimoveis.net] Contato de cliente "
    if contact_message.property_id.present?
      subject_text = subject_text + "sobre o imovel #{contact_message.property_id}"
    end
    mail(:subject => "#{subject_text}")
  end

end