class EmploymentOpportunitiesController < ApplicationController
    def show
      @employment_opportunity = EmploymentOpportunity.find(params[:id])
    end
    def index
        @employmentOpportunities = EmploymentOpportunity.all
      end    
  end
  