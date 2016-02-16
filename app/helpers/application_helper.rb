module ApplicationHelper
  require 'net/http'
  require 'uri'
  
  def self.sendCode(phone)
    params = {}

    apikey = '3fd0346b9953fe923baea3358f4e6b8f'
  
    get_user_info_uri = URI.parse('https://sms.yunpian.com/v1/user/get.json')
  
    send_sms_uri = URI.parse('https://sms.yunpian.com/v1/sms/send.json')
  
    send_tpl_sms_uri = URI.parse('https://sms.yunpian.com/v1/sms/tpl_send.json')
  
    send_voice_uri = URI.parse('https://voice.yunpian.com/v1/voice/send.json')

    params['apikey'] = apikey
    # params['text'] = text
    params['tpl_id'] = 1234885
    
    print "API send verification code to :"
    print phone
    
    params['mobile'] = phone 
    # params['text'] = text
    # params['tpl_id'] = 1234885
    number = rand(5 ** 5)
    print "verification code is:"
    print number
    
    params['tpl_value'] = URI::escape('#code#')+'='+URI::escape(number.to_s)  
    response = Net::HTTP.post_form(send_tpl_sms_uri,params)
    
    print '--------'
    print response.body + "\n"
    print '--------'
    
    number
  end
  
  def self.now
    Time.now.getutc.to_i * 1000
  end
  
end
