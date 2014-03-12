class AdsController < ApplicationController
  def index
    render :json => @ads
  end
end
