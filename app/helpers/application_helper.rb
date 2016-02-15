module ApplicationHelper
  require 'net/http'
  require 'uri'
  params = {}

  #修改为您的apikey.可在官网（http://www.yuanpian.com)登录后用户中心首页看到
  apikey = '3fd0346b9953fe923baea3358f4e6b8f'
  #修改为您要发送的手机号码，多个号码用逗号隔开
  #修改为您要发送的短信内容 
  
  text = '【好安心】您的验证码是'
  
  #查询账户信息HTTP地址
  get_user_info_uri = URI.parse('https://sms.yunpian.com/v1/user/get.json')
  #智能匹配模板发送HTTP地址
  send_sms_uri = URI.parse('https://sms.yunpian.com/v1/sms/send.json')
  #指定模板发送接口HTTP地址
  send_tpl_sms_uri = URI.parse('https://sms.yunpian.com/v1/sms/tpl_send.json')
  #发送语音验证码接口HTTP地址
  send_voice_uri = URI.parse('https://voice.yunpian.com/v1/voice/send.json')

  params['apikey'] = apikey
  #打印用户信息e
  # response =  Net::HTTP.post_form(get_user_info_uri,params)
  # print response.body + "\n"

  params['text'] = text
  #智能匹配模板发送
  #指定模板发送
  #设置模板ID，如使用1号模板:【#company#】您的验证码是#code#
  #设置对应的模板变量值

  params['tpl_id'] = 1234885
  # params['tpl_value'] = URI::escape('#code#')+'='+URI::escape('1234')
  
  def self.sendCode(mobile)
    p "API send verification code to :"
    p mobile
    
    params['mobile'] = mobile 
    # params['text'] = text
    # params['tpl_id'] = 1234885
    number = rand(5 ** 5)
    p "verification code is:"
    p number
    
    params['tpl_value'] = URI::escape('#code#')+'='+URI::escape(number.to_s)  
    response = Net::HTTP.post_form(send_tpl_sms_uri,params)
    
    print '--------'
    print response.body + "\n"
    print '--------'    
    
        
  end
  
  
end
