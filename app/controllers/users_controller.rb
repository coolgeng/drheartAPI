class UsersController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender
  
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    # respond_to do |format|
    #   format.json { render }
    #   format.xml { render xml: @users }
    # end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    
    render json: @user
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Users/1
  # PATCH/PUT /Users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:User])
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Users/1
  # DELETE /Users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end
  
  # def heart_rate_list
  #   @user = User.find(params[:id])
  #
  #   render json: @user.heart_rates
  # end
  
  private
     # Using a private method to encapsulate the permissible parameters is just a good pattern
     # since you'll be able to reuse the same permit list between create and update. Also, you
     # can specialize this method with per-user checking of permissible attributes.
     def user_params
       params.require(:user).permit(:name, :sex, :age, :phone1, :avatar)
     end
end
