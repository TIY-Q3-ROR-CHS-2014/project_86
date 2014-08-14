class TablesController < ApplicationController
before_action :find_table, only: [:show, :edit, :update, :destroy, :transition]

  before_action :find_restaurant

  def index
    @tables = Table.all
  end

  def show
    @appointment = Appointment.new
  end

  def new
    @table = Table.new
    @medications = Medication.all
    @doctors = Doctor.all
  end

  def create
    @table = @restaurant.tables.new(table_params)
    if @table.save == true
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    @medications = Medication.all
    @doctors = Doctor.all
  end

  def update
    if @table.update_attributes table_params
      redirect_to restaurant_table_path(@restaurant, @table)
    else
      render :edit
    end
    # @prescription = Prescription.create prescription_params
  end

  def destroy
    @table.destroy
    redirect_to restaraunt_path(@restaurant)
  end
 
  def transition
    event = params[:event]+'!'
    @table.send(event.to_sym)
    redirect_to restaurant_table_path(@restaurant, @table)
  end

private

  def find_table
    @table = Table.find params[:id]
    # @prescriptions = Prescription.find params[:id]
  end

  def find_restaurant
    @restaurant = Restaurant.find params[:restaurant_id]
  end

  # def find_prescriptions
  #   @prescription = Prescription.find params[:]
  # end

  # def find_appointments

  # end

  def patient_params
    params.require(:patient).permit(:lastname, :firstname, :description, :dob, :gender, :facility_id, {medication_ids: []}, {doctor_ids: []})

  end
end
