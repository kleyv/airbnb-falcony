class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(investor_id: current_user.id)
  end

  def create
  end

  def bookmark?
    bookmark
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_back(fallback_location: root_path, notice: "Bookmark cancelled")
  end
end
