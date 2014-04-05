class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_filter :is_logged, :except => [:login, :new, :create, :activation]

  def activation
    act_hash = params[:act_hash]
    user = User.where(hashed_password: act_hash ).first

    if user.nil?
      redirect_to root_path, :notice => (t "Korisnik ne postoji.")
    else
      user.is_activated = 1
      user.save
      redirect_to root_path, :notice => (t "Korisnik je aktiviran")
    end


  end

  def login

    if @user = User.authenticate(params[:username], params[:password])
      session[:user_id] = @user.id
      session[:user_name] = @user.username
      logger.debug "Proslo dalje"
      respond_to do |format|
        format.json {
        }
        format.html {
          redirect_to root_path, :notice => (t "user.logged_in_successfully")
        }
      end
    else
      respond_to do |format|
        format.json {
          render :json => {:error => "true", :message => (t "user.does_not_exist")}
        }
        format.html {
          redirect_to root_path, :alert => (t "user.invalid_login_params")
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
        redirect_to root_path, :notice => (t "user.logged_out_successfully")
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
          render :json => {:error => "true", :message => (t "user.does_not_exist")}
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
      @user.is_activated = 0


      respond_to do |format|
        if @user.save
          UserMailer.activate_account(@user).deliver
          format.html { redirect_to @user, notice: (t "user.succesfully_created") }
          format.json { render action: 'show', status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to new_user_path, notice: (t user.invalid_fields) }
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
        format.html { redirect_to @user, notice: (t "user.succesfully_updated") }
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
    params.require(:user).permit(:username, :email, :name,:password,:password_confirmation, :contact, :description,:avatar)
  end
end 