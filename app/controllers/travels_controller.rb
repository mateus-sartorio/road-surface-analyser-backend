require 'csv'

class TravelsController < ApplicationController
  before_action :set_travel, only: %i[show edit update destroy]

  # GET /travels or /travels.json
  def index
    @travels = Travel.all
  end

  # GET /travels/1 or /travels/1.json
  def show
    render json: @travel
  end

  # GET /travels/new
  def new
    @travel = Travel.new
  end

  # GET /travels/1/edit
  def edit
  end

  # POST /travels or /travels.json
  def create
    @travel = Travel.new(travel_params)

    respond_to do |format|
      if @travel.save
        format.html { redirect_to @travel, notice: 'Travel was successfully created.' }
        format.json { render :show, status: :created, location: @travel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travels/1 or /travels/1.json
  def update
    respond_to do |format|
      if @travel.update(travel_params)
        format.html { redirect_to @travel, notice: 'Travel was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travels/1 or /travels/1.json
  def destroy
    @travel.destroy!

    respond_to do |format|
      format.html { redirect_to travels_path, status: :see_other, notice: 'Travel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /travels/map
  # Returns a static HTML file located in `public/map.html` (adjust filename as needed)
  def static_page
    file_path = Rails.root.join('public', 'map.html')

    unless File.exist?(file_path)
      render plain: 'Static file not found', status: :not_found
      return
    end

    # Serve the file inline as HTML
    send_file file_path, type: 'text/html', disposition: 'inline'
  end

  # GET /travels/export_csv?travel_id=:id (opcional)
  def export_csv
    travel_id = params[:travel_id]
    
    if travel_id.present?
      # Exporta dados de uma travel específica
      begin
        travel = Travel.find(travel_id)
        travels = [travel]
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Travel not found' }, status: :not_found
        return
      end
    else
      # Exporta dados de todas as travels
      travels = Travel.all
    end

    csv_data = CSV.generate(headers: true) do |csv|
      # Cabeçalhos do CSV
      csv << [
        'Travel ID',
        'Record ID',
        'Timestamp Begin',
        'Timestamp End',
        'Accelerometer X',
        'Accelerometer Y',
        'Accelerometer Z',
        'Gyroscope X',
        'Gyroscope Y',
        'Gyroscope Z',
        'User Accelerometer X',
        'User Accelerometer Y',
        'User Accelerometer Z',
        'Location Latitude',
        'Location Longitude',
        'Location Altitude',
        'Location Accuracy',
        'Location Bearing',
        'Location Speed',
        'Location Timestamp',
        'Location Speed Accuracy',
        'Location Bearing Accuracy Degrees',
        'Location Vertical Accuracy Meters',
        'Rating Value'
      ]

      # Dados de cada travel e seus records
      travels.each do |travel|
        records = travel.record.includes(:accelerometer, :gyroscope, :location, :user_accelerometer, :rating)
                         .order(:timestamp_begin)
        
        records.each do |record|
          csv << [
            travel.id,
            record.id,
            record.timestamp_begin,
            record.timestamp_end,
            record.accelerometer&.x,
            record.accelerometer&.y,
            record.accelerometer&.z,
            record.gyroscope&.x,
            record.gyroscope&.y,
            record.gyroscope&.z,
            record.user_accelerometer&.x,
            record.user_accelerometer&.y,
            record.user_accelerometer&.z,
            record.location&.latitude,
            record.location&.longitude,
            record.location&.altitude,
            record.location&.accuracy,
            record.location&.bearing,
            record.location&.speed,
            record.location&.timestamp,
            record.location&.speedAccuracy,
            record.location&.bearingAccuracyDegrees,
            record.location&.verticalAccuracyMeters,
            record.rating&.value
          ]
        end
      end
    end

    # Define o nome do arquivo baseado no contexto
    filename = if travel_id.present?
                 "travel_#{travel_id}_records_#{Date.current}.csv"
               else
                 "all_travels_records_#{Date.current}.csv"
               end

    # Retorna o arquivo CSV para download
    send_data csv_data,
              filename: filename,
              type: 'text/csv',
              disposition: 'attachment'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_travel
    @travel = Travel.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def travel_params
    params.expect(travel: %i[device_id timestamp_begin timestamp_end])
  end
end
