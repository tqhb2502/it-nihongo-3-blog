module Authors
  class CommentsController < AuthorsController
    
    before_action :set_post, only: [:create, :update, :destroy]
    before_action :set_comment, only: [:update, :destroy]
  
    # POST /comments
    def create
      @comment = @post.comments.build(comment_params)
      @comment.save
      # redirect_to post_path(@post.id)
    end
  
    # PATCH/PUT /comments/1
    def update
      if @comment.update(comment_params)
        redirect_to @comment, notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /comments/1
    def destroy
      @comment.destroy
      redirect_to post_path(@post.id)
    end
  
    private
      def set_post
        @post = Post.find(params[:post_id])
      end
    
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = @post.comments.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def comment_params
        params.require(:comment).permit(:author_id, :post_id, :content)
      end
  end
end
