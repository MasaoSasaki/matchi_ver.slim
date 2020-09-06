class Owner::MenuTagsController < Owner::Base

  def create
    new_menu_tag = MenuTag.new
    menu_id = params[:menu_id]
    restaurant_id = params[:restaurant_id]
    @tag_id = params[:tag_id]
    new_menu_tag.tag_id = @tag_id
    new_menu_tag.menu_id = @@menu_id
    new_menu_tag.save
    redirect_to edit_owner_restaurant_menu_path(restaurant_id, menu_id)
  end

  def destroy
    MenuTag.find(params[:tag_id]).destroy
    redirect_to edit_owner_restaurant_menu_path(params[:restaurant_id], params[:menu_id])
  end

end
