module Authors
  class ElementsController < AuthorsController
    
    before_action :set_post
    before_action :set_element, only: [:show, :edit, :update, :destroy, :move]
  
    # POST /elements
    def create
      
      @element = @post.elements.build(element_params)
  
      if @element.save
        notice = nil
      else
        notice = @element.errors.full_messages.join(". ") << "."
      end
      
      redirect_to edit_post_path(@post), notice: notice
    end
  
    # PATCH/PUT /elements/1
    def update
      @element.update(element_params)
      redirect_to edit_post_path(@element.post)
    end
  
    # DELETE /elements/1
    def destroy
      @element.destroy
      redirect_to edit_post_path(@element.post)
    end
    
    # PATCH /elements/1/move
    def move
      @element.insert_at(params[:position].to_i)
      head :ok
    end
  
    private
      def set_post
        @post = current_author.posts.find(params[:post_id])
      end
    
      # Use callbacks to share common setup or constraints between actions.
      def set_element
        @element = @post.elements.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def element_params
        params.require(:element).permit(:element_type, :content, :image)
      end
  end
end
