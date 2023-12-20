class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  # before_action :set_profile, only: %i[ show new edit create update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end
   # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end
  # def new
  #   @profile = Profile.find(params[:profile_id])
  #   @post = Post.new
  # end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # def create
  #   @profile = Profile.find(params[:profile_id])
  #   @post = @profile.posts.new(post_params)
  #   respond_to do |format|
  #     if @post.save
  #       format.html { redirect_to profile_url(@profile), notice: "Post was successfully created." }
  #       format.json { render :show, status: :created, location: @post }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @profile = @post.profile
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
      p = nil

      if params[:post]
        p = params.require(:post)
      elsif params[:text_post]
        p = params.require(:text_post)
      elsif params[:image_post]
        p = params.require(:image_post)
      elsif params[:video_post]
        p = params.require(:video_post)
      elsif params[:figma_post]
        p = params.require(:figma_post)
      end

      p.permit(:post_title, :pic, :description, :link, :type).merge(user_id: current_user.id)
    end
end
