# app/controllers/my_devise/registrations_controller.rb
class MyDevise::RegistrationsController < Devise::RegistrationsController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		respond_to do |format|
			if @user.save
				format.html { redirect_to root_path, notice: 'Usuario creado exitosamente!.' }
				format.json { render action: 'Mostrar', status: :created, location: @user}
			else
				format.html { render action: 'Nuevo' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
	def update
		super
	end
	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :administrator, :technician, :labBoss)
	end
end