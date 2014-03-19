class SearchController < ApplicationController
  def users
    respond_to do |format|
      format.json {
        if params[:keyword]
          users = User.search params[:keyword]
          render :json => users
        end
      }
    end
  end

  def ads
    respond_to do |format|
      format.json {
        ads = AdOffer.search params[:keyword], params[:type], params[:price]
        render :json => ads
      }
    end
  end
end
