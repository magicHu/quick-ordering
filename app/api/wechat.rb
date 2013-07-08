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
        request_params = parse_request_body request_body

        status("200")
        response_objs = get_response request_params
        to_text_xml(request_params, *response_objs) unless response_objs.empty?
      end
    end
    
  end
end

