class AdminsController < ApplicationController

	before_action :confirm_logged_in
  before_action :current_user_admin
  before_action :initialize_params

	def new
		@admin = Admin.new
	end

	def create	
		@admin = Admin.new(admin_params)
		if @admin.save
			flash[:success] = 'You successfully created the admin whose email is: #{@admin.email}'
			redirect_to controller: 'users', action: 'profile'
		else
			render :new
		end
	end

	def edit
		@admin = Admin.find(params[:id])
	end

	def update
		@admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:success] = "#{@admin.email}'s information has been successfully updated."
      redirect_to controller: 'users', action: 'profile'
    else
      render :edit
    end
	end

	def delete
		@admin = Admin.find(params[:id])
	end

	def destroy
		@admin = Admin.find(params[:id])
		if @admin.destroy
			flash[:success] = "Admin '#{@admin.first_name}' has been successfully destroyed."
			redirect_to controller: 'access', action: 'login'
		else
			render :delete
		end
	end

end
