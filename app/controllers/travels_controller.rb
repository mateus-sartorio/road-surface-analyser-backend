class TravelsController < ApplicationController
  before_action :set_travel, only: %i[show edit update destroy]

  # GET /travels or /travels.json
  def index
    @travels = Travel.all
  end

  # GET /travels/1 or /travels/1.json
  def show
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_travel
    @travel = Travel.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def travel_params
    # params.require(:travel).permit(:device_id, :timestamp_begin, :timestamp_end)
    params.expect(travel: %i[device_id timestamp_begin timestamp_end])
  end
end
