class SubscriptionController < ApplicationController
  protect_from_forgery :except => [:add, :delete, :list]

  def add

  end

    def delete
      respond_to do |format|
        format.json {
          Subscription.destroy(params[:id])
          msg = { :status => "ok", :message => "Success!", :html => "<b>Obrisano</b>" }
          render :json => msg
        }
      end

    end

    def list
      user = User.where(id: params[:id]).first
      respond_to do |format|
        format.json {
          if user.nil?
            render :json => {:error => "true", :message => "Navedeni korisnik ne postoji."}
          else
            user_subs = Subscription.where(user_id: user.id)
            render :json => user_subs
          end
        }
      end
    end
  end