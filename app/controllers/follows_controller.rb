class FollowsController < ApplicationController


	def create
            stylist = Stylist.find(params[:stylist_id])
            favorite = current_user.follows.new(stylist_id: stylist.id)
            favorite.save
            redirect_to stylist_path(stylist)
        end
        def destroy
            stylist = Stylist.find(params[:stylist_id])
            favorite = current_user.follows.find_by(stylist_id: stylist.id)
            favorite.destroy
            redirect_to stylist_path(stylist)
        end
end
