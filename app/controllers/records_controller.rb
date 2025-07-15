class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update destroy]

  # GET /records or /records.json
  def index
    @records = Record.all
  end

  # GET /records/1 or /records/1.json
  def show
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
    params.expect(record: [:travel_id,
                           :timestamp_begin,
                           :timestamp_end,
                           { accelerometer_attributes: %i[x y z] }])
    #  gyroscope: %i[x y z],
    #  user_accelerometer: %i[x y z],
    #  location: %i[latitude longitude altitude accuracy bearing speed timestamp
    #               speedAccuracy bearingAccuracyDegrees verticalAccuracyMeters])
    # params.require(:record).permit(
    #   # Parâmetros simples no primeiro nível
    #   :travel_id,
    #   :timestamp_begin,
    #   :timestamp_end,
    #   # Para objetos aninhados, passamos um hash onde a chave é o nome do objeto
    #   # e o valor é um array com os atributos permitidos dentro dele.
    #   accelerometer: %i[x y z],
    #   gyroscope: %i[x y z],
    #   userAccelerometer: %i[x y z],
    #   location: %i[
    #     latitude
    #     longitude
    #     altitude
    #     accuracy
    #     bearing
    #     speed
    #     timestamp
    #     speedAccuracy
    #     bearingAccuracyDegrees
    #     verticalAccuracyMeters
    #   ]
    # )
    #
    # params.require(:record).permit(
    #   :travel_id,
    #   :timestamp_begin,
    #   :timestamp_end,
    #   accelerometer: %i[x y z],
    #   gyroscope: %i[x y z],
    #   user_accelerometer: %i[x y z],
    #   location: %i[
    #     latitude longitude altitude accuracy bearing speed timestamp
    #     speed_accuracy bearing_accuracy_degrees vertical_accuracy_meters
    #   ]
    # )
  end
end
