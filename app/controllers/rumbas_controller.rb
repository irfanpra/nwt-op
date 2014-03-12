class RumbasController < ApplicationController
  soap_service namespace: 'urn:WashOut'
    soap_action "iti_naslov_ad",
              :args   => :integer,
              :return => :string
  def iti_naslov_ad
    render :soap =>  Ad.find(params[:value]).title
  end
  
end