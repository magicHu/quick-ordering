# encoding : utf-8

module Wechat
  class WechatAPI < Grape::API
      
    version 'v1', :using => :path, :vendor => 'quick_order'
    format :txt
    content_type :xml, "text/xml"

    helpers WechatHelper
    
    
  end
end