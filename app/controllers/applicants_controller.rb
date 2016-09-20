class ApplicantsController < ApplicationController
 
   
	def index
		@applicant = Applicant.all
	end

	def new
		@applicant = Applicant.new
	end

	def create
		@applicant = Applicant.new(applicant_params)
			if @applicant.save
				#flash[:success] = "Welcome to the alpha blog #{@applicant.applicantname}"
				redirect_to thankyou_path
			else
				render 'new'
			end
	end

	def destroy
		@applicant = Applicant.find(params[:id])
		@applicant.destroy
		redirect_to applicants_path
	end
private

	def applicant_params
		params.require(:applicant).permit(:name, :email, :location, :description, :category, :site)
	end
end

