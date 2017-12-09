class AdminMailer < ApplicationMailer

	def update_admin(current_user , admin)
    @current_user = current_user
		@admin = admin
		mail(to: @admin.email, subject: "Alteração de cadastro")
	end

end
