class AccelerometersController < ApplicationController
  before_action :set_accelerometer, only: %i[ show edit update destroy ]

  # GET /accelerometers or /accelerometers.json
  def index
    @accelerometers = Accelerometer.all
  end

  # GET /accelerometers/1 or /accelerometers/1.json
  def show
  end

  # GET /accelerometers/new
  def new
    @accelerometer = Accelerometer.new
  end

  # GET /accelerometers/1/edit
  def edit
  end

  # POST /accelerometers or /accelerometers.json
  def create
    @accelerometer = Accelerometer.new(accelerometer_params)

    respond_to do |format|
      if @accelerometer.save
        format.html { redirect_to @accelerometer, notice: "Accelerometer was successfully created." }
        format.json { render :show, status: :created, location: @accelerometer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @accelerometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accelerometers/1 or /accelerometers/1.json
  def update
    respond_to do |format|
      if @accelerometer.update(accelerometer_params)
        format.html { redirect_to @accelerometer, notice: "Accelerometer was successfully updated." }
        format.json { render :show, status: :ok, location: @accelerometer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @accelerometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accelerometers/1 or /accelerometers/1.json
  def destroy
    @accelerometer.destroy!

    respond_to do |format|
      format.html { redirect_to accelerometers_path, status: :see_other, notice: "Accelerometer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accelerometer
      @accelerometer = Accelerometer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def accelerometer_params
      params.expect(accelerometer: [ :x, :y, :z ])
    end
end
