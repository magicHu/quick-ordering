# encoding : utf-8

module WechatHelper
  
  def check_sign(params) 
    # 将token、timestamp、nonce三个参数进行字典序排序
    # 将三个参数字符串拼接成一个字符串进行sha1加密
    expect_sign = Digest::SHA1.hexdigest([token, params['timestamp'], params['nonce']].sort.join)

    response_str = 'error'
    if expect_sign == params['signature']
      response_str = params['echostr'] 
    end
    return response_str
  end

  
  
end