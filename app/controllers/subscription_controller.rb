class SubscriptionController < ApplicationController
  #protect_from_forgery :except => [:create, :delete, :list]
  def create
    respond_to do |format|
      format.json {
        attachmentN = Sub.create(attachment_params)
        #attachmentN.user_id = 1 # POPRAVITI  da radi kada se user loginuje
        attachmentN.save
        msg = { :status => "ok", :message => "Success!", :html => attachmentN}
        render :json => msg
      }
      format.html {
        render :status => :method_not_allowed, :nothing => true
        return
      }
    end

  end

  def delete

  end

  def list

  end
end
