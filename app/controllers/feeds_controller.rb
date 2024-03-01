class FeedsController < ApplicationController
  before_action :authenticate_guest

  def index
    @posts = Post.all
    @employmentOpportunities = EmploymentOpportunity.all
    # Any other setup needed for the feed
  end

end
