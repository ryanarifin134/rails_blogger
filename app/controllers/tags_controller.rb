class TagsController < ApplicationController

  # /tags
  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' was destroyed!"
    redirect_to tags_path
  end
end
