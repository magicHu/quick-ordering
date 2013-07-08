# encoding : utf-8
require_relative "../models/food"
require_relative "../models/restaurant"

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

  # 解析微信发送的消息，把解析后的内容全部放到request_params中
  def parse_request_body(request_body)
    request_params = {}
    Hash.from_xml(request_body)['xml'].each do |key, value|
      request_params[key.to_s.underscore.to_sym] = value
    end
    request_params
  end

  def get_response request_params
    response_objs = []
    if request_params[:msg_type] == "text"
      content = request_params[:content]
      # s9，查看指定餐馆的信息
      if content =~ /^s\d+$/
        shop_id = content.sub("s", "").to_i
        shop = Restaurant.find(shop_id)
        response_objs << shop if shop
      # s，查看所有餐馆的信息
      elsif content == "s"
        shops = Restaurant.all
        response_objs.concat shops
      # 123，查看指定菜的信息
      elsif content == /^\d+$/
        food = Food.find(content.to_i)
        response_objs << food if food
      # d123，对某个菜下订单
      elsif content == /^d\d+$/

      # 帮助
      elsif content == "h"

      elsif content == "t"

      else

      end  
    end
    response_objs
  end

  # 返回text格式的xml消息给微信
  def to_text_xml request_params, *response_objs
    content = ""
    response_objs.each do |response|
      next if response.nil?
      content << "\n" unless content.empty?
      content << response.to_text
    end
    return if content.empty?
    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.xml {
        xml.ToUserName { xml.cdata request_params[:from_user_name] }
        xml.FromUserName { xml.cdata request_params[:to_user_name] }
        xml.CreateTime Time.now.to_i
        xml.MsgType { xml.cdata "text" }
        xml.Content { xml.cdata content}
        xml.FuncFlag 0
      }
    end
    builder.to_xml
  end
  
end

class Food
  def to_text
    "(#{id})#{name}--￥#{price}"
  end
end

class Restaurant
  def to_text
    text = ""
    text << "(s#{id})#{name}"
    foods.each do |food|
      text << "\n\t#{food.to_text}"
    end
    text
  end
end