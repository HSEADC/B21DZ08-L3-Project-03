class Api::V1::EmploymentOpportunitiesController < Api::V1::ApplicationController
    def index
      @employment_opportunities = EmploymentOpportunity.all
    end    
    def show
      @employment_opportunity = EmploymentOpportunity.find(params[:id])
    end
  end
  