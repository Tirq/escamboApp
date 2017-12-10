class Backoffice::SendMessageController < ApplicationController
	before_action :set_admin, only: [:edit]
  before_action :set_message, only: [:create]

	Message = Struct.new(:recipient, :subject , :message , :current_admin)

	def edit
		
	end

	def create
		begin
			@notice = "Mensagem enviada com sucesso!"
			@notice_type="success"
			#raise testar erro ....
			AdminMailer.send_message(@msg).deliver_now
		rescue
			@notice = "Ops...Tivemos um problema enviando mensagem!"
			@notice_type="danger"
		end
		
		
	end

private 
  def set_admin
		@admin = Admin.find(params[:id])
	end

	def set_message
		@msg = Message.new(params[:recipient],params[:subject],params[:message] , current_admin) 
	end

end
