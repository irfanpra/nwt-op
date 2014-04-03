class PasswordRecoveryTokensController < ApplicationController
  before_action :set_password_recovery_token, only: [:show, :edit, :update, :destroy]

  def pwd_recovery
    respond_to do |format|
      format.html
      format.json { render :nothing => true }
    end
  end

  def pwd_recovery_post
    user_email = params[:request_reset_email]
    user = User.where(email: user_email).first
    respond_to do |format|
      format.html{
        if user.nil?
          redirect_to pwd_recovery_path
          return
        else
          @prt =  PasswordRecoveryToken.where(user_id: user.id).first

          if @prt.nil?
            # user never requested token before, create a new one for him
            @prt =  PasswordRecoveryToken.new
            @prt.user = user
            @prt.token = Digest::SHA2.hexdigest("leno")
            if @prt.valid?
              @prt.save
              UserMailer.password_recovery(user, @prt).deliver
            else
              redirect_to index_path
              return
            end
          else
            # user already requested token, check if it's too old
            if (Time.now - @prt.updated_at) > 1.hour
              # token is older than 1 hour, update prt with new token
              @prt.token = Digest::SHA2.hexdigest(user.updated_at + Date.today)
              if @prt.valid?
                @prt.save
                UserMailer.password_recovery(user, @prt).deliver
              else
                redirect_to index_path
                return
              end
            else
              flash[:error] = 'Vec ste poslali jedan zahtjev za zaboravljenu lozinku u proteklih sat vremena, provjerite Vas postanski sanducic ili pokusajte malo kasnije...'
              redirect_to pwd_recovery_path
              return
            end
          end
        end
      }
    end
  end

  def pwd_recovery_confirm

  end

  # GET /password_recovery_tokens
  # GET /password_recovery_tokens.json
  def index
    @password_recovery_tokens = PasswordRecoveryToken.all
  end

  # GET /password_recovery_tokens/1
  # GET /password_recovery_tokens/1.json
  def show
  end

  # GET /password_recovery_tokens/new
  def new
    @password_recovery_token = PasswordRecoveryToken.new
  end

  # GET /password_recovery_tokens/1/edit
  def edit
  end

  # POST /password_recovery_tokens
  # POST /password_recovery_tokens.json
  def create
    @password_recovery_token = PasswordRecoveryToken.new(password_recovery_token_params)

    respond_to do |format|
      if @password_recovery_token.save
        format.html { redirect_to @password_recovery_token, notice: (t "password_recovery.successfully_created") }
        format.json { render action: 'show', status: :created, location: @password_recovery_token }
      else
        format.html { render action: 'new' }
        format.json { render json: @password_recovery_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /password_recovery_tokens/1
  # PATCH/PUT /password_recovery_tokens/1.json
  def update
    respond_to do |format|
      if @password_recovery_token.update(password_recovery_token_params)
        format.html { redirect_to @password_recovery_token, notice: (t "password_recovery.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @password_recovery_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /password_recovery_tokens/1
  # DELETE /password_recovery_tokens/1.json
  def destroy
    @password_recovery_token.destroy
    respond_to do |format|
      format.html { redirect_to password_recovery_tokens_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_password_recovery_token
      @password_recovery_token = PasswordRecoveryToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def password_recovery_token_params
      params.require(:password_recovery_token).permit(:token)
    end
end
