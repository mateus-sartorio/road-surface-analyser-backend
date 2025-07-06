class UserAccelerometersController < ApplicationController
  before_action :set_user_accelerometer, only: %i[ show edit update destroy ]

  # GET /user_accelerometers or /user_accelerometers.json
  def index
    @user_accelerometers = UserAccelerometer.all
  end

  # GET /user_accelerometers/1 or /user_accelerometers/1.json
  def show
  end

  # GET /user_accelerometers/new
  def new
    @user_accelerometer = UserAccelerometer.new
  end

  # GET /user_accelerometers/1/edit
  def edit
  end

  # POST /user_accelerometers or /user_accelerometers.json
  def create
    @user_accelerometer = UserAccelerometer.new(user_accelerometer_params)

    respond_to do |format|
      if @user_accelerometer.save
        format.html { redirect_to @user_accelerometer, notice: "User accelerometer was successfully created." }
        format.json { render :show, status: :created, location: @user_accelerometer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_accelerometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_accelerometers/1 or /user_accelerometers/1.json
  def update
    respond_to do |format|
      if @user_accelerometer.update(user_accelerometer_params)
        format.html { redirect_to @user_accelerometer, notice: "User accelerometer was successfully updated." }
        format.json { render :show, status: :ok, location: @user_accelerometer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_accelerometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_accelerometers/1 or /user_accelerometers/1.json
  def destroy
    @user_accelerometer.destroy!

    respond_to do |format|
      format.html { redirect_to user_accelerometers_path, status: :see_other, notice: "User accelerometer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_accelerometer
      @user_accelerometer = UserAccelerometer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_accelerometer_params
      params.expect(user_accelerometer: [ :x, :y, :z ])
    end
end
