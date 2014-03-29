class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def login_get

  end

  def login
    if @user = User.authenticate(params[:username], params[:password])
      session[:user_id] = @user.id
      session[:user_name] = @user.username

      respond_to do |format|
        format.json {
        }
        format.html {
          redirect_to root_path, :notice => "Logged in"
        }
      end
    else
      respond_to do |format|
        format.json {
          render :json => {:error => "true", :message => "Navedeni korisnik ne postoji."}
        }
        format.html {
          redirect_to root_path, :alert => "Invalid user/password combination"
        }
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_name] = nil

    respond_to do |format|
      format.json {
      }
      format.html {
        redirect_to root_path, :notice => "Logged out"
      }
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    set_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def all
    @users = User.all
    render json: @users
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
    if verify_recaptcha
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User was successfully created.' }
          format.json { render action: 'show', status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    
  end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
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
    params.require(:user).permit(:username, :email, :name,:password,:password_confirmation, :contact, :description)
  end
end 