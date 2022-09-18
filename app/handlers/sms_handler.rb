require 'json'
require_relative "../services/sms_service.rb"

# def send_sms(event:, context:)
#   request_body = JSON.parse(event['Records'].first['body'])
#   receiver = request_body['receiver']
#   content = request_body['content']

#   sms_args = {type: 'SMS', coutry: '82'}
#   coolsms = Coolsms::SMS::Send.new(sms_args)
#   coolsms.send(ENV['COOLSMS_SENDER'], receiver, content)
# end

def send_message(event:, context:)
  event['Records'].each do |record|
    params =  JSON.parse(record['body'])
    receiver = params['receiver']
    country_code = params['country_code']
    content = params['content']
    if country_code == '82' || country_code.nil?
      SmsService.instance.send_coolsms(receiver,country_code,content)
    else
      # SmsService.instance.send_twilio(receiver,country_code,content)
    end
  end
end