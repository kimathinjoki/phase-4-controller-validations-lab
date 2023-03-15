class PostsController < ApplicationController

  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  # # added rescue_from
  # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    render json: post

    rescue ActiveRecord::RecordInvalid => invalid
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  # def render_not_found_response
  #   render json: { error: "post not found" }, status: :not_found
  # end
  # def render_unprocessable_entity_response(invalid)
  #   render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  # end

end
