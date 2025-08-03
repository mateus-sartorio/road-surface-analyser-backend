class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update destroy]
  protect_from_forgery with: :null_session

  # GET /records or /records.json
  def index
    @records = Record.all
  end

  # GET /records/1 or /records/1.json
  def show
    render json: @record.to_json(include: [:accelerometer, :user_accelerometer, :gyroscope, :location])
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records or /records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
        logger.debug "FAILED TO SAVE: #{@record.errors.full_messages}"
      end
    end
  end

  # POST /records/bulk_create
  def bulk_create
    @records = []
    errors = []
    
    bulk_params[:records].each_with_index do |record_data, index|
      record = Record.new(record_data)
      
      if record.save
        @records << record
      else
        errors << { index: index, errors: record.errors.full_messages }
      end
    end
    
    respond_to do |format|
      if errors.empty?
        format.json { 
          render json: {
            message: "#{@records.count} records created successfully",
            records: @records.as_json(include: [:accelerometer, :user_accelerometer, :gyroscope, :location])
          }, status: :created 
        }
      else
        format.json { 
          render json: {
            message: "Some records failed to create",
            created_count: @records.count,
            errors: errors
          }, status: :unprocessable_entity 
        }
      end
    end
  end

  # PATCH/PUT /records/1 or /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record.destroy!

    respond_to do |format|
      format.html { redirect_to records_path, status: :see_other, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_record
    @record = Record.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def record_params
    params.expect(record: [
      :travel_id,
      :timestamp_begin,
      :timestamp_end,
      { accelerometer_attributes: [:x, :y, :z] },
      { gyroscope_attributes: [:x, :y, :z] },
      { user_accelerometer_attributes: [:x, :y, :z] },
      { location_attributes: [:latitude, :longitude, :altitude, :accuracy, :bearing, :speed, :timestamp, :speedAccuracy, :bearingAccuracyDegrees, :verticalAccuracyMeters] }
    ])
  end

  def bulk_params
    params.require(:bulk_create).permit({
      records: [
        :travel_id,
        :timestamp_begin,
        :timestamp_end,
        { accelerometer_attributes: [:x, :y, :z] },
        { gyroscope_attributes: [:x, :y, :z] },
        { user_accelerometer_attributes: [:x, :y, :z] },
        { location_attributes: [:latitude, :longitude, :altitude, :accuracy, :bearing, :speed, :timestamp, :speedAccuracy, :bearingAccuracyDegrees, :verticalAccuracyMeters] }
      ]
    })
  end
end
