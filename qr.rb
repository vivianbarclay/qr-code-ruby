# Write your solution here!
require "rqrcode"

# Use the RQRCode::QRCode class to encode some text
#qrcode = RQRCode::QRCode.new("SMSTO:9876543210:Hi Alice! It's")

# Use the .as_png method to create a 500 pixels by 500 pixels image
#png = qrcode.as_png({ :size => 500 })

# Write the image data to a file
#IO.binwrite("sometext.png", png.to_s)

puts "Hello, would you like a URL, wifi network, or text message to be encoded in the QR code?"
puts "-"*50

valid_options = ["url", "wifi network", "text message"]
user_response = ""

# Loop until a valid input is provided
until valid_options.include?(user_response.downcase)
  puts "Please input a valid option: URL, wifi, or text message."
  user_response = gets.chomp
end

if user_response.upcase == "URL"
  puts "Please enter the URL below:"
  puts "-"*50
  user_url = gets.chomp
  
  url_qrcode = RQRCode::QRCode.new("https://#{user_url}")
  url_png = url_qrcode.as_png({ :size => 500})
  IO.binwrite("URL_QR_Code.png", url_png.to_s)

elsif user_response.downcase == "wifi network"
  puts "Please input the Wifi network:"
  user_wifi_network = gets.chomp
  puts "Please input the Wifi password:"
  user_wifi_password = gets.chomp


  wifi_qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{user_wifi_network};P:#{user_wifi_password};;")
  wifi_png = wifi_qrcode.as_png({ :size => 500})
  IO.binwrite("wifi_QR_Code.png", wifi_png.to_s)

elsif user_response.downcase == "text message"
  puts "Please input the phone number:"
  user_phone_number = gets.chomp
  puts "Please input the message:"
  user_text_message = gets.chomp

  text_qrcode = RQRCode::QRCode.new("SMSTO:#{user_phone_number}:#{user_text_message}")
  text_png = text_qrcode.as_png({ :size => 500})
  IO.binwrite("text_QR_Code.png", text_png.to_s)

end 
