class FollowsController < ApplicationController
    before_action :logged_in , only: [:show]
    

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

    def show
            @stylist = Stylist.find(params[:id])
            @follows = Follow.where("stylist_id = ?", @stylist)



    end


    private


    def logged_in
        unless user_signed_in? || stylist_signed_in?
            redirect_to root_path
            
        end
        
    end
end
