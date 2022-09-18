# require 'httparty'
require 'json'
require 'coolsms'

def send_sms(event:, context:)
  request_body = JSON.parse(event['Records'].first['body'])
  receiver = request_body['receiver']
  content = request_body['content']

  sms_args = {type: 'SMS', coutry: '82'}
  coolsms = Coolsms::SMS::Send.new(sms_args)
  coolsms.send(ENV['COOLSMS_SENDER'], receiver, content)
end
