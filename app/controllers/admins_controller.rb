class AdminsController < ApplicationController

	before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

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

end
