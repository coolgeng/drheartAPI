require 'json'

class PatientsController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender
  
  
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all

    # respond_to do |format|
    #   format.json { render }
    #   format.xml { render xml: @patients }
    # end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show    
    @patient = Patient.find(params[:userid])
    
    # render json: @patient
    render "patients/show"
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new

    render json: @patient
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])

    if @patient.save
      render json: @patient, status: :created, location: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    @patient = Patient.find(params[:userid])

    if @patient.update_attributes(params[:patient])
      head :no_content
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:userid])
    @patient.destroy

    head :no_content
  end
  
  def heart_rate_list
    @patient = Patient.find(params[:userid])
    
    # render json: @patient.heart_rate
    render "patients/heart_rate_list"
  end
  
  def incident_list
    @patient = Patient.find(params[:userid])
    
    # render json: @patient.incident 
    render "patients/incident_list"
  end
    
  def doctor_list
    @patient = Patient.find(params[:userid])
    
    p "---------" 
    p @patient.doctors
      p "---------"   
    # render json: @patient.doctors
    render "patients/doctor_list"
  end
  
  def add_doctor
    @patient = Patient.find(params[:userid])
    @doctor = Doctor.find(params[:doctorid])
    
    @doctor.doctor_patients.create(:patient_id => @patient.id,:status => 0)
    
    if @doctor.save
      render json: @patient, status: :created, location: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end

    # @patient = Patient.new(params[:patient])
    #
    # if @patient.save
    #   render json: @patient, status: :created, location: @patient
    # else
    #   render json: @patient.errors, status: :unprocessable_entity
    # end
    
  end
  
  def upload_heartrate
    @patient = Patient.find(params[:userid])
    
    @heart_rate_list = params[:heart_rate_list]
    
    my_json = JSON.parse(@heart_rate_list)
    
    my_json['heart_rate_list'].each do |heart_rate|
      @heart_rate = HeartRate.new(user_id: @patient.id, patient_id: @patient.id, rate: heart_rate['hr'], updated_at: heart_rate['t'])
      @heart_rate.save
    end
    
  end
  
  
  private
     # Using a private method to encapsulate the permissible parameters is just a good pattern
     # since you'll be able to reuse the same permit list between create and update. Also, you
     # can specialize this method with per-patient checking of permissible attributes.
     def patient_params
       params.require(:patient).permit(:name, :sex, :age, :phone, :avatar)
     end
end