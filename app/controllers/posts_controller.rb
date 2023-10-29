class PostsController < ApplicationController
  before_action :authenticate_user!, expect: %i[ show ]
  load_and_authorize_resource
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_profile, only: %i[ show new edit create update destroy ]

  # GET /posts or /posts.json
  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = @profile.posts.new(post_params)
    # @post = @profile.posts.new(post_title: params[:post][:post_title], pic: params[:post][:pic], description: params[:post][:description], link: params[:post][:link], user_id: current_user.id)

    respond_to do |format|
      if @post.save
        format.html { redirect_to profile_url(@profile), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to profile_url(@profile), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to profile_url(@profile), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:post_title, :pic, :description, :link).merge(user_id: current_user.id)
    end
end
