class SoatController < ApplicationController

  # GET /soat/new
  def new
  end

  # POST /soat/
  def create
  end

  # GET /soat/render_info_by_vehicle/:placa
  def render_info_by_vehicle
    placa = params["placa"] if params["placa"].present?

    @vehicle = Vehicle.find_by(placa: placa)

    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /soat/get_tariffs_by_type
  def get_tariffs_by_type
    @tariffs = Tariff.where(tariff_type_id: params["id"])

    render json: {success: true, data: @tariffs}
  end

  # GET /soat/render_shooping_cart
  def render_shooping_cart
    @order   = Order.new

    @vehicle = Vehicle.create(placa: sanitize_soat_params["placa"], date: sanitize_soat_params["date"], tariff_id: sanitize_soat_params["tariff_id"],)
    @user    = User.create(document: sanitize_soat_params["document"], document_type: sanitize_soat_params["document_type"], full_name: sanitize_soat_params["full_name"], email: sanitize_soat_params["email"], password: sanitize_soat_params["password"], phone: sanitize_soat_params["phone"])

    @order.tariff_id   = sanitize_soat_params["tariff_id"]
    @order.vehicle_id  = @vehicle.id
    @order.user_id     = @user.id
    @order.status      = 0 # unconfirmed
    @order.payment_value = @vehicle.tariff.total_value

    if @order.save
      start_at  = Time.new(Time.zone.now.year, @vehicle.date.month, @vehicle.date.day)
      finish_at = Time.new(Time.zone.now.year + 1, @vehicle.date.month, @vehicle.date.day)

      @order.update(start_at: start_at, finish_at: finish_at)
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /soat/send_notification
  def send_notification
    @order = Order.find_by(id: sanitize_tc_params["order_id"])

    @tc = CreditCard.create(
      owner_name: sanitize_tc_params["owner_name"],
      number: sanitize_tc_params["number"],
      cvv: sanitize_tc_params["cvv"],
      due_date: "#{sanitize_tc_params['month']}/#{sanitize_tc_params['year']}",
      cuote_number: sanitize_tc_params["coute_number"]
    )

    @order.update(credit_card_id: @tc.id, status: 1)

    params = {
      placa: @order.vehicle.placa,
      start_at: @order.start_at.strftime('%F'),
      finish_at: @order.finish_at.strftime('%F'),
      tariff_type_description: @order.tariff.tariff_type.description,
      tariff_description: @order.tariff.cylinders_description,
      full_name: @order.user.full_name,
      total: ActionController::Base.helpers.number_to_currency(@order.tariff.total_value, unit: "$", seperator: ".", delimiter: "," )
    }

    email = InfoMailer.with(info: params, to: @order.user.email).new_info_email
    email.deliver_now

    respond_to do |format|
      format.html {
        redirect_to root_path, error: 'Gracias por adquirir tu SOAT con nosotros, te enviaremos un correo con la informacion de tu poliza.'
      }
    end
  end

  # GET /soat/render_payment
  def render_payment
    @order = Order.find_by(id: params["id"])
  end

  private

  def sanitize_soat_params
    params
      .permit(:placa, :date, :tariff_type_id, :tariff_id, :document_type, :document, :full_name, :phone, :email, :password)
      .to_h
  end

  def sanitize_tc_params
    params
      .permit(:owner_name, :number, :cvv, :month, :year, :coute_number, :order_id)
      .to_h
  end

end
