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
    @patient = Patient.find_by_user_id(params[:userid])
        
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
    @patient = Patient.find_by_user_id(params[:userid])
    
    # render json: @patient.heart_rate
    render "patients/heart_rate_list"
  end
  
  def incident_list    
    @patient = Patient.where(user_id: params[:userid]).first
    type = params[:type].downcase
    
    if @patient.nil?
      render "patients/error"
    elsif type == 'no'
      @incidents = Incident.joins('left join doctors on incidents.doctor_id = doctors.id left join patients on patients.id = incidents.patient_id').select("doctors.name as doctor_name, incidents.*, patients.* ").where("incidents.patient_id = ? and state in (0)", @patient.id)
      render "patients/incident_list"             
    else
      @incidents = Incident.joins('left join doctors on incidents.doctor_id = doctors.id left join patients on patients.id = incidents.patient_id').select("doctors.name as doctor_name, incidents.*, patients.* ").where("incidents.patient_id = ? and state in (0,1)", @patient.id)
      render "patients/incident_list"         
    end
    
    # if @patient.nil?
    #
    # else
    #   @incident = Incident.find_by_patient_id(@patient.user_id)
    #
    # end
    
    # render json: @patient.incident 
    
  end
    
  def doctor_list
    @patient = Patient.where(user_id: params[:userid]).first
    
    if @patient.nil?
      render "patients/error"
    else
      @doctors = Doctor.joins("INNER JOIN `doctor_patients` ON `doctors`.`id` = `doctor_patients`.`doctor_id`").select("`doctors`.*, `doctor_patients`.status as status").where("`doctor_patients`.`patient_id` = ?", @patient.id)
      render "patients/doctor_list"            
    end
  end
  
  def add_doctor
    @patient = Patient.where(user_id: params[:userid]).first
    @doctor = Doctor.where(user_id: params[:doctorid]).first
    
    if !DoctorPatient.where(patient_id: @patient.id, doctor_id: @doctor.id).first.nil?
      render "patients/exist_error"
    else
      begin
        @doctor.doctor_patients.create(:patient_id => @patient.id,:status => 1)

        if @doctor.save
          render "patients/add_doctor"
        end
      
        rescue ActiveRecord::RecordNotUnique

          render "error"
      end      
    end
    

    # @patient = Patient.new(params[:patient])
    #
    # if @patient.save
    #   render json: @patient, status: :created, location: @patient
    # else
    #   render json: @patient.errors, status: :unprocessable_entity
    # end
    
  end
  
  def remove_doctor
    @doctor = Doctor.where(user_id: params[:doctorid]).first
    @patient = Patient.where(user_id: params[:userid]).first
    
    if !@doctor.nil? && !@patient.nil?
      DoctorPatient.delete_all(patient_id: @patient.id, doctor_id: @doctor.id)      
    end
    
    render "patients/success"
  end
  
  
  def upload_heartrate
    @patient = Patient.where(user_id: params[:userid]).limit(1)
    
    user_id = @patient.first.user_id
    id = @patient.first.id
    
    @heart_rate_list = params[:heart_rate_list]
    
    my_json = JSON.parse(@heart_rate_list)
    
    begin 
      my_json.each do |heart_rate|
        @heart_rate = HeartRate.new(user_id: user_id, patient_id: id, rate: heart_rate['hr'], occurring_time: heart_rate['t'])
        @heart_rate.save
      end
    rescue ActiveRecord::ActiveRecordError
      render "error"
    end
    
      render "patients/upload_heartrate"      
      
  end
  
  def search_doctor
    keyword = params[:keyword]
    
    
    # @doctors = Doctor.joins('left join doctor_patients on doctors.id = doctor_patients.doctor_id left join patients on patients.id = doctor_patients.patient_id').select("doctors.*, doctor_patients.*").where("doctors.name like ?", "%#{keyword}%")
    @patient = Patient.where(user_id: params[:userid]).first
    
    if @patient.nil?
      render "patients/error"
    else
      @doctors = Doctor.joins('left join doctor_patients on doctors.id = doctor_patients.doctor_id 
                              left join patients on patients.id = doctor_patients.patient_id').
                              select("doctors.*, doctor_patients.*").where("doctors.name like ? and patients.user_id = ? ", "%#{keyword}%", params[:userid]) +
                              Doctor.joins('left join doctor_patients on doctors.id = doctor_patients.doctor_id 
                                                          left join patients on patients.id = doctor_patients.patient_id').
                                                          select("doctors.*, 0 as status").where("doctors.name like ? and patients.user_id != ? ", "%#{keyword}%", params[:userid])                             
  
      render "patients/search_doctor"      
    end
    
  end
  
  def incidentnum
    type = params[:type].downcase
            
    if type == 'no'
      @incident_num = Patient.joins('left join incidents on patients.id = `incidents`.`patient_id`').select("*").where("user_id = ? and state = 0 ", params[:userid]).count
    else
      @incident_num = Patient.joins('left join incidents on patients.id = `incidents`.`patient_id`').select("*").where("user_id = ?", params[:userid]).count
    end
    
    render "patients/incidentnum"
  end
  
  private
     # Using a private method to encapsulate the permissible parameters is just a good pattern
     # since you'll be able to reuse the same permit list between create and update. Also, you
     # can specialize this method with per-patient checking of permissible attributes.
     def patient_params
       params.require(:patient).permit(:name, :sex, :age, :phone, :avatar, :user_id, :id)
     end
end