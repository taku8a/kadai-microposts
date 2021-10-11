class BookmarksController < ApplicationController
    before_action :require_user_logged_in
    
    def create
        bookmark = current_user.bookmarks.build(micropost_id: params[:micropost_id])
        bookmark.save
        flash[:success] = "ブックマークしました。"
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        bookmark = Bookmark.find_by(micropost_id: params[:micropost_id], user_id: current_user.id)
        bookmark.destroy
        flash[:success] = "ブックマークを外しました。"
        redirect_back(fallback_location: root_path)
    end
    
    
    
    
end
