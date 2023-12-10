class Api::V1::ProfilesController < Api::V1::ApplicationController
  def index
    @profiles = Profile.all
  end
  def show
    @profile = Profile.find(params[:id])
  end
end
