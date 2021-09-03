class AdminController < ApplicationController

  # GET /admin/sign_in
  def login
  end

  # POST /admin/sign_in
  def sign_in
    user = User.find_by(email: sanitize_sign_in_params["email"], password: sanitize_sign_in_params["password"])

    respond_to do |format|
      if user.present?

        format.html {
          redirect_to '/orders'
        }
        format.json { render json: { status: true, message: @sales } }
      else

        format.html {
          redirect_to '/admin/login', error: 'Usuario y/o contaseña no validob.'
        }
        format.json { render json: { status: false, message: @sales } }
      end
    end
  end

  private

  def sanitize_sign_in_params
    params
      .permit(:email, :password)
      .to_h
  end

end
