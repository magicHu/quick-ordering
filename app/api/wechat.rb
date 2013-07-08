# encoding : utf-8

module Wechat
  class WechatAPI < Grape::API
      
    version 'v1', :using => :path, :vendor => 'quick_order'
    format :txt
    content_type :xml, "text/xml"

    helpers WechatHelper
    
    resource :weixin do

      desc '快捷订餐微信接口校验'
      get do
        check_sign(params)
      end

      desc '快捷订餐微信接口'
      post do
        request_body = request.body.read
        #Rails.logger.info request_body
        request_params = parse_request_body request_body

        status("200")
        response = nil
        #Rails.logger.info response.to_xml
        response.to_xml
      end
    end

    private

    # 解析微信发送的消息，把解析后的内容全部放到request_params中
    def parse_request_body(request_body)
      request_params = {}
      Hash.from_xml(request_body)['xml'].each do |key, value|
        request_params[key.to_s.underscore.to_sym] = value
      end
      request_params
    end
    
  end
end