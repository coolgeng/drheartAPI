class DoctorsController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender
  
  
  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all

    # respond_to do |format|
    #   format.json { render }
    #   format.xml { render xml: @doctors }
    # end
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show    
    @doctor = Doctor.find(params[:id])
    
    render json: @doctor
  end

  # GET /doctors/new
  # GET /doctors/new.json
  def new
    @doctor = Doctor.new

    render json: @doctor
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(params[:doctor])

    if @doctor.save
      render json: @doctor, status: :created, location: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    @doctor = Doctor.find(params[:id])

    if @doctor.update_attributes(params[:doctor])
      head :no_content
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy

    head :no_content
  end
  
  def heart_rate_list
    @doctor = Doctor.find(params[:id])
    
    render json: @doctor.heart_rate
  end
  
  def incident_list
    @doctor = Doctor.find(params[:id])
    
    render json: @doctor.incident
  end
    
  def doctor_list
    @doctor = Doctor.find(params[:id])
    
    render json: @doctor.doctors
  end
  
  def add_doctor
    @doctor = Doctor.new(params[:doctor])    
    
    if @doctor.save
      render json: @doctor, status: :created, location: @doctor
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
    
  end
  
  private
     # Using a private method to encapsulate the permissible parameters is just a good pattern
     # since you'll be able to reuse the same permit list between create and update. Also, you
     # can specialize this method with per-doctor checking of permissible attributes.
     def doctor_params
       params.require(:doctor).permit(:name, :sex, :age, :phone, :avatar, :hospital, :sector, :position)
     end
end