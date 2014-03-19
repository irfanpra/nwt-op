class RumbasController < ApplicationController
  soap_service namespace: 'urn:WashOut'
    soap_action "get_diskusija",
              :args   => :integer,
              :return => :string
  def get_diskusija
    render :soap =>  Discussion.find(params[:value]).content
  end
  
end