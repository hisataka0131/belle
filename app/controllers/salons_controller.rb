class SalonsController < ApplicationController

	def show
        @stylist = Stylist.find(params[:id])



    end


    private

    def params_salon
  	params.require(:salon).permit(:stylist_id)

    end
end
