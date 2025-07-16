class GyroscopesController < ApplicationController
  before_action :set_gyroscope, only: %i[ show edit update destroy ]

  # GET /gyroscopes or /gyroscopes.json
  def index
    @gyroscopes = Gyroscope.all
  end

  # GET /gyroscopes/1 or /gyroscopes/1.json
  def show
    render json: @gyroscope
  end

  # GET /gyroscopes/new
  def new
    @gyroscope = Gyroscope.new
  end

  # GET /gyroscopes/1/edit
  def edit
  end

  # POST /gyroscopes or /gyroscopes.json
  def create
    @gyroscope = Gyroscope.new(gyroscope_params)

    respond_to do |format|
      if @gyroscope.save
        format.html { redirect_to @gyroscope, notice: "Gyroscope was successfully created." }
        format.json { render :show, status: :created, location: @gyroscope }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gyroscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gyroscopes/1 or /gyroscopes/1.json
  def update
    respond_to do |format|
      if @gyroscope.update(gyroscope_params)
        format.html { redirect_to @gyroscope, notice: "Gyroscope was successfully updated." }
        format.json { render :show, status: :ok, location: @gyroscope }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gyroscope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gyroscopes/1 or /gyroscopes/1.json
  def destroy
    @gyroscope.destroy!

    respond_to do |format|
      format.html { redirect_to gyroscopes_path, status: :see_other, notice: "Gyroscope was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gyroscope
      @gyroscope = Gyroscope.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gyroscope_params
      params.expect(gyroscope: [ :x, :y, :z ])
    end
end
