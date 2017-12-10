class AdminMailer < ApplicationMailer

	def update_admin(current_user , admin)
    @current_user = current_user
		@admin = admin
		mail(to: @admin.email, subject: "Alteração de cadastro")
	end

	Message = Struct.new(:recipient, :subject , :message , :current_user)

	def send_message(msg)
		@msg = msg
		mail(to: msg.recipient, subject: msg.subject)
	end

end
