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
    @doctor = Doctor.find(params[:userid])
    
    render "doctors/show"
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
    @doctor = Doctor.find(params[:userid])

    if @doctor.update_attributes(params[:doctor])
      head :no_content
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor = Doctor.find(params[:userid])
    @doctor.destroy

    head :no_content
  end
  
  
  def incident_list
    @doctor = Doctor.find(params[:userid])
    
    render "doctors/patient_list"
  end
    
  def patient_list
    @doctor = Doctor.find(params[:userid])
    
    render "doctors/patient_list"
  end
  
  
  def treat
    @doctor = Doctor.find(params[:userid])
    @incident = Incident.find(params[:incident_id])
    begin
      @incident.update_attribute(:treat, params[:treat])
        render "doctors/treat"      
    rescue ActiveRecord::ActiveRecordError
      render "error"      
    end
    
  end
  
  
  def accept 
    @patient = Patient.find(params[:patient_id])
    @doctor = Doctor.find(params[:userid])    
    
    @doctor_patients = @doctor.doctor_patients
    @doctor_patients.update_all(:status => params[:accept] == 1 ? 1 : -1)
    # @doctor.doctor_patients.create(:patient_id => @patient.id,:status => @accept == 1 ? 1 : -1)
    # @doctor.doctor_patients.
    
    begin 
      @doctor.save
      rescue ActiveRecord::ActiveRecordError
        render "error"
    end
    
      render "doctors/accept"
    # @doctor = Doctor.new(params[:doctor])
    #
    # if @doctor.save
    #   render json: @doctor, status: :created, location: @doctor
    # else
    #   render json: @doctor.errors, status: :unprocessable_entity
    # end
    
  end
  
  private
     # Using a private method to encapsulate the permissible parameters is just a good pattern
     # since you'll be able to reuse the same permit list between create and update. Also, you
     # can specialize this method with per-doctor checking of permissible attributes.
     def doctor_params
       params.require(:doctor).permit(:name, :sex, :age, :phone, :avatar, :hospital, :sector, :position)
     end
end