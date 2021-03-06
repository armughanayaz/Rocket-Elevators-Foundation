class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]

  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
  end

  # GET /interventions/get_buildings
  def get_buildings
    @interventions = Intervention.all
    @customers = Building.where(customer_id: params[:customerId])
    render json: @customers
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)

    respond_to do |format|
      if @intervention.save
        format.html { redirect_to @intervention, notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
    #{@quote.compagnyName}
    #{@quote.compagnyName}
    puts "params"
    puts params[:customerId]
    ZendeskAPI::Ticket.create!($client, 
      :type => "question", 
      :subject => "", 
      :comment => { :value => 
        "Comment: The company  as made a quote for a building of type and wants the service. 
      Quote information
      Number of Elevator: 
      Total Elevators Price:
      Installation Fees: 
      Total: "}, :submitter_id => $client.current_user.id , :priority => "urgent")
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author, :customerId, :buildingId, :batterieId, :columnId, :elevatorId, :employeeId, :start_date, :end_date, :result, :report, :status)
    end
end
