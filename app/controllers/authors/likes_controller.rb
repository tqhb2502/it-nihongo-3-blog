module Authors
  class LikesController < AuthorsController
    
    before_action :set_post
    before_action :set_like, only: [:destroy]
  
    # POST /likes
    def create
      @like = @post.likes.build(like_params)
      if @like.save
        msg = { :like_id => @like.id }
        render :json => msg
      end
    end
  
    # DELETE /likes/1
    def destroy
      @like.destroy
    end
  
    private
      def set_post
        @post = Post.find(params[:post_id])
      end
    
      # Use callbacks to share common setup or constraints between actions.
      def set_like
        @like = @post.likes.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def like_params
        params.require(:like).permit(:author_id, :post_id)
      end
  end
end