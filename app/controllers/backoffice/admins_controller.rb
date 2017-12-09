class Backoffice::AdminsController < Backoffice::BackofficeController
	before_action :set_admin , only: [:edit , :update, :destroy]
	after_action :verify_authorized, only: [:new , :destroy]
	after_action :verify_policy_scoped, only: :index

	def index
		@admins = policy_scope(Admin)
	end

	def new
		@admin = Admin.new
		authorize @admin
	end

	def destroy
		authorize @admin
		admin_email = @admin.email
		if @admin.destroy
			redirect_to backoffice_admins_path , notice: I18n.t('messages.destroyed_with', item: admin_email)   	
		else
			render :index
		end 
	end

	def edit	
	end

	def create
		@admin = Admin.new
		@admin = Admin.new(params_admin)
		if @admin.save
			redirect_to backoffice_admins_path , notice: I18n.t('messages.destroyed_with', item: @admin.email)  
		else
			render :new
		end

	end

	def update
	  resolve_passwords
		if @admin.update(params_admin)
			redirect_to backoffice_admins_path, notice:  I18n.t('messages.updated_with', item: @admin.email)
			AdminMailer.update_admin(current_admin , @admin).deliver_now
		else
			render :edit
		end
	end

	private

	def resolve_passwords
		if passwords_blanks?
	  	delete_pwd_params
	  end	
	end

	def passwords_blanks?
		params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?  	
	end 

	def delete_pwd_params
		params[:admin].delete(:password)
	  params[:admin].delete(:password_confirmation)
	end

	def set_admin
		@admin = Admin.find(params[:id])
	end

	def params_admin
		#params.require(:admin).permit(:name, :email, :password, :password_confirmation)
		params.require(:admin).permit(policy(@admin).permitted_attributes)
	end

end