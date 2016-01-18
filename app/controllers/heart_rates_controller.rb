class HeartRatesController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender
  
  # GET /heartrates
  # GET /heartrates.json
  def index
    @heartrates = heartrate.all

    # respond_to do |format|
    #   format.json { render }
    #   format.xml { render xml: @heartrates }
    # end
  end
 
  # GET /heartrates/1 
  # GET /heartrates/1.json
  def show
    @heartrate = heartrate.find(params[:id])
    
    render json: @heartrate
  end

  # GET /heartrates/new
  # GET /heartrates/new.json
  def new
    @heartrate = heartrate.new

    render json: @heartrate
  end

  # POST /heartrates -- > uploadheartrate
  # POST /heartrates.json
  def create
    @heartrate = heartrate.new(params[:heartrate])

    if @heartrate.save
      render json: @heartrate, status: :created, location: @heartrate
    else
      render json: @heartrate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /heartrates/1
  # PATCH/PUT /heartrates/1.json
  def update
    @heartrate = heartrate.find(params[:id])

    if @heartrate.update_attributes(params[:heartrate])
      head :no_content
    else
      render json: @heartrate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /heartrates/1
  # DELETE /heartrates/1.json
  def destroy
    @heartrate = heartrate.find(params[:id])
    @heartrate.destroy

    head :no_content
  end
  
  private
     # Using a private method to encapsulate the permissible parameters is just a good pattern
     # since you'll be able to reuse the same permit list between create and update. Also, you
     # can specialize this method with per-heartrate checking of permissible attributes.
     def heartrate_params
       params.require(:heartrate).permit(:rate)
     end
  
  
end