class AdminMailerPreview < ActionMailer::Preview

  def update_email
    AdminMailer.update_admin(Admin.first , Admin.last)
  end

Message = Struct.new(:recipient, :subject , :message , :current_admin)
  def send_message
  	msg= Message.new('ti@gmail.com','título', 'conteúdo', 'Pi');
		AdminMailer.send_message(msg)	  	
  end

end