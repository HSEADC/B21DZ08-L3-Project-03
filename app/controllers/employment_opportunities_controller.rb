class EmploymentOpportunitiesController < ApplicationController
    def show
      @employment_opportunity = EmploymentOpportunity.find(params[:id])
    end
    def index
        @employmentOpportunities = EmploymentOpportunity.all
      end    
      def new
        @employment_opportunity = EmploymentOpportunity.new
      end
    
      def create
        Rails.logger.debug "Form submitted with params: #{params.inspect}"
        @employment_opportunity = EmploymentOpportunity.new(employment_opportunity_params)
        @employment_opportunity.user_id = current_user.id  # Set the user_id here
        if @employment_opportunity.save
          redirect_to @employment_opportunity, notice: 'Employment opportunity was successfully created.'
        else
          Rails.logger.debug "Failed to save: #{@employment_opportunity.errors.full_messages}"
          render :new
        end
      end
                    
      def edit
        @employment_opportunity = EmploymentOpportunity.find(params[:id])
      end
    
      def update
        @employment_opportunity = EmploymentOpportunity.find(params[:id])
      
        if @employment_opportunity.update(employment_opportunity_params)
          redirect_to @employment_opportunity, notice: 'Employment opportunity was successfully updated.'
        else
          render :edit
        end
      end
            def employment_opportunity_params
        params.require(:employment_opportunity).permit(:title, :description, :vacancy_type, :status, :application_deadline, :location, :company_name, :work_environment, :salary, :requirements, :conditions, :contact_link, :about_link)
      end
          
  end
  