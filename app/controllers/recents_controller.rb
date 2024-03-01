class RecentsController < ApplicationController
  def add
    @employment_opportunity = EmploymentOpportunity.find(params[:id])
    recent = current_user.recents.last
    recent.employment_opportunities.delete(@employment_opportunity)
    recent.employment_opportunities << @employment_opportunity
    if recent.employment_opportunities.size > 3
      puts "=========================="
      puts "=========================="
      puts "=========================="
      recent.employment_opportunities.each do |opportunity|
        puts opportunity.id
      end
      puts "=========================="
      puts "=========================="
      puts "=========================="
      oldest_to_keep = recent.employment_opportunities.reverse_order.limit(3)
      recent.employment_opportunities = oldest_to_keep
      puts "=========================="
      puts "=========================="
      puts "=========================="
      recent.employment_opportunities.each do |opportunity|
        puts opportunity.id
      end
      puts "=========================="
      puts "=========================="
      puts "=========================="
    end
    recent.save
    redirect_to employment_opportunity_path(@employment_opportunity)
  end
end
