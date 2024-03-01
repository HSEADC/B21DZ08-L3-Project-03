class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
  def create
    jti = request.headers["Authorization"]
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last if auth_header
    user = User.find_by_jti(token)
    if user.nil?
      render json: { error: "User not found" }, status: :not_found
      return
    end
    puts "WHY"
    @post = user.posts.new(post_params)
    puts "NOT"
        if @post.save
        render json: @post, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity 
      end
  end
  private
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

    p.permit(:post_title, :pic, :description, :link, :type)
  end
end
