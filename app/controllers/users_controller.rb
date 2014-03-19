class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def all
    @users = User.all
    render json: @users
  end

  def logout
    reset_session
  end

  def login


  end

  def get
    @user = User.where(id: params[:id]).first
    respond_to do |format|
      format.json {
        if @user.nil?
          render :json => {:error => "true", :message => "Navedeni korisnik ne postoji."}
        else
          render :json => @user
        end
      }
    end
  end



  # POST /users
  # POST /users.json
  def create
    @user = User.new(id: 22, username: "almir")

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def edit
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :email, :name,:password, :contact, :description)
  end
end 