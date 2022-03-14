class ApplicationController < ActionController::API

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
