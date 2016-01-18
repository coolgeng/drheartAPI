class PatientsController
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender
  
  
  # GET /patients
  # GET /patients.json
  def index
    @patients = patient.all

    # respond_to do |format|
    #   format.json { render }
    #   format.xml { render xml: @patients }
    # end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = patient.find(params[:id])
    
    render json: @patient
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = patient.new

    render json: @patient
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = patient.new(params[:patient])

    if @patient.save
      render json: @patient, status: :created, location: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    @patient = patient.find(params[:id])

    if @patient.update_attributes(params[:patient])
      head :no_content
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = patient.find(params[:id])
    @patient.destroy

    head :no_content
  end
  
  def heart_rate_list
    @patient = patient.find(params[:id])
    
    render json: @patient.heart_rates
  end
  
  private
     # Using a private method to encapsulate the permissible parameters is just a good pattern
     # since you'll be able to reuse the same permit list between create and update. Also, you
     # can specialize this method with per-patient checking of permissible attributes.
     def patient_params
       params.require(:patient).permit(:name, :sex, :age, :phone1, :avatar)
     end
end