class SoatController < ApplicationController

  # GET /soat/new
  def new
  end

  # POST /soat/
  def create
  end

  # POST /soat/render_info_by_vehicle/:placa
  def render_info_by_vehicle
    placa = params["placa"] if params["placa"].present?

    @vehicle = Vehicle.find_by(placa: placa)
  end

  private

  def sanitize_soat_params
    params
      .require(:soat)
      .permit(:password, user: [])
      .to_h
  end

end
