class Master::TagsController < Master::Base

  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to action: 'index'
    else
      render 'index'
    end
  end

  def destroy
    Tag.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

end
