class ApplicationController < ActionController::API

  def not_found
    render json: { error: 'not_found' }, status: 404
  end

  def authorize_request
    header = request.headers['Authorization']
    header = request.split(' ').last if header.nil?
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def qr_as_base64(url)
    qrcode = RQRCode::QRCode.new(url)
    png = qrcode.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 240,
      border_modules: 4,
      module_px_size: 6,
    )
    png.to_data_url
  end

end
