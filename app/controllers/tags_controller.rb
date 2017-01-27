class TagsController < ApplicationController

  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.js { render :show }
      else
        format.js { render :show }
      end
    end
  end

  protected
  def tag_params
    params.fetch(:tag, {}).permit(:name)
  end
end