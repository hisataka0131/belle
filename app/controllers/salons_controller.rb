class SalonsController < ApplicationController
    before_action :logged_in , only: [:show]


	def show
        @stylist = Stylist.find(params[:id])



    end


    private

    def params_salon
  	params.require(:salon).permit(:stylist_id)

    end

    def logged_in
        unless user_signed_in? || stylist_signed_in?
            redirect_to root_path
            
        end
        
    end



end
