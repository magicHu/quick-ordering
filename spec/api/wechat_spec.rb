# encoding : utf-8
require 'spec_helper'

module Wechat

  describe WechatAPI do
    
    let(:request_body) { 
      <<-EOF 
        <xml>
         <ToUserName><![CDATA[quick_order]]></ToUserName>
         <FromUserName><![CDATA[jobs]]></FromUserName> 
         <CreateTime>1348831860</CreateTime>
         <MsgType><![CDATA[text]]></MsgType>
         <Content><![CDATA[鱼香肉丝]]></Content>
         <MsgId>1234567890123456</MsgId>
       </xml>
      EOF
    }

    it "should parse request body" do
      api = WechatAPI.new
      params = api.send(:parse_request_body, request_body)
      params.size.should == 6
      params[:to_user_name].should == "quick_order"
      params[:from_user_name].should == "jobs"
      params[:create_time].should == "1348831860"
      params[:msg_type].should == "text"
      params[:content].should == "鱼香肉丝"
      params[:msg_id].should == "1234567890123456"
    end


  end
end