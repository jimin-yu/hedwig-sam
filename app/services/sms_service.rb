require 'singleton'
require 'coolsms'

class SmsService
  include Singleton

  # TWILIO_ACCOUNT_ID = ENV['TWILIO_ACCOUNT_ID']
  # TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  # TWILIO_SENDER = ENV['TWILIO_SENDER']

  COOLSMS_SENDER = ENV['COOLSMS_SENDER']
  def initialize()
    @logger = Logger.new(STDOUT)
  end

  # def send_twilio(receiver, country_code, content)
  #   twilio = Twilio::REST::Client.new(TWILIO_ACCOUNT_ID,TWILIO_AUTH_TOKEN)
  #   sms_args = {
  #     from: TWILIO_SENDER,
  #     to: "+#{country_code}#{receiver}",
  #     body: content
  #   }
  #   result = twilio.messages.create(sms_args)
  #   @logger.info(result)
  # end

  def send_coolsms(receiver, country_code="82", content)
    sms_args = {type: 'SMS', country: country_code}
    coolsms = Coolsms::SMS::Send.new(sms_args)
    result = coolsms.send(COOLSMS_SENDER,receiver,content)
    @logger.info(result)
  end
end