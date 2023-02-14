module Authors
  class LikesController < AuthorsController
    
    before_action :set_post
    before_action :set_like
  
    # POST /likes
    def create
      @like = @post.likes.build(like_params)
      @like.save
      redirect_to post_path(@post.id)
    end
  
    # DELETE /likes/1
    def destroy
      @like.destroy
      redirect_to post_path(@post.id)
    end
  
    private
    
      def set_post
        @post = Post.find(params[:id])
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