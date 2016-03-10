module UserHelper
  # require 'aliyun/oss'
  # require 'aliyun/sts'

  def self.get_bucket
 #    client = Aliyun::OSS::Client.new(
 #      :endpoint => 'http://drheart.oss-cn-hangzhou.aliyuncs.com',
 #      :access_key_id => 'eLLnkPk5m5XdO6XG',
 #      :access_key_secret => 'mkpPU4mAFQpzzoAOb9PPECESU4ZGGR',
 #      :cname => true)
 #      # sts = Aliyun::STS::Client.new(
 # #        access_key_id: 'eLLnkPk5m5XdO6XG',
 # #        access_key_secret: 'mkpPU4mAFQpzzoAOb9PPECESU4ZGGR')
 # #
 # #      token = sts.assume_role('role-arn', 'my-app')
 # #
 # #      client = Aliyun::OSS::Client.new(
 # #        :endpoint => 'http://oss-cn-hangzhou.aliyuncs.com',
 # #        :access_key_id => token.access_key_id,
 # #        :access_key_secret => token.access_key_secret,
 # #        :sts_token => token.security_token)
 #
 #     bucket = client.get_bucket('drheart')
 #     objects = bucket.list_objects
 #     objects.each{ |o| puts o.key }     
  end
    
end