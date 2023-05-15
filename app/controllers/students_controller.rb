class StudentsController < ApplicationController
	layout 'admin'
	include ApplicationHelper
	before_action :set_student, only: %i[show edit update destroy]
	helper_method :formatted_date

	def index
		@students = Student.all
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to students_path, notice: 'Student has been created successfully'
		else
			render :new
		end
	end

	def show 	
		#@student = Student.find(params[:id])
	end

	def edit
		#@student = Student.find(params[:id])
		date = formatted_date(@student.date_of_birth)
	end

	def update
		#@student = Student.find(params[:id])
		if @student.update(student_params)
			redirect_to student_path(@student), notice: 'Student has been updated successfully'
		else
			render :edit 
		end
	end

	def destroy
		#@student = Student.find(params[:id]) 
		@student.destroy
		redirect_to students_path, notice: 'Student has been deleted successfully'
	end

	def test
	end
	# def create
	# 	@student = Student.new(
	# 	first_name: params[:student][:first_name],
	# 	last_name: params[:student][:last_name],
	# 	email: params[:student][:email]
	# 	)
	# 	if @student.save
	# 		redirect_to students_path
	# 	else
	# 		render :new
	# 	end
	# end

	private

	def student_params
		params.require(:student).permit(:first_name, :last_name, :email, :date_of_birth, :alternate_contact_number, :permanent_contact_number, :local_address, :permanent_address, :profile_image)
	end

	def set_student
		@student = Student.find(params[:id]) 
	end

	def formatted_date(date)
		date.strftime('%A, %b %d, %Y') if date.present?
	end
end