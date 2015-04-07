class AdminsController < ApplicationController

	def add
	end

	def create	
		@admin = Admin.new(admin_params)
		if @admin.save
			flash[:success] = 'You successfully created the admin whose email is: #{@admin.email}'
			redirect_to(controller: 'users', action: 'index')
		else
			flash[:danger] = 'Unable to create admin'
			render('add')
		end
	end

	def admin_params
		params.require(:admin).permit(:first_name, :last_name, :username, :email, :email_confirmation, :password, :password_confirmation)
	end
end
