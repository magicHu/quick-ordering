# encoding : utf-8
require 'spec_helper'

module Wechat

  describe Wechat::WechatAPI do

    let(:request_s1_body) { 
      <<-EOF 
        <xml>
         <ToUserName><![CDATA[quick_order]]></ToUserName>
         <FromUserName><![CDATA[jobs]]></FromUserName> 
         <CreateTime>1348831860</CreateTime>
         <MsgType><![CDATA[text]]></MsgType>
         <Content><![CDATA[s1]]></Content>
         <MsgId>1234567890123456</MsgId>
       </xml>
      EOF
    }

    let(:request_1_body) { 
      <<-EOF 
        <xml>
         <ToUserName><![CDATA[quick_order]]></ToUserName>
         <FromUserName><![CDATA[jobs]]></FromUserName> 
         <CreateTime>1348831860</CreateTime>
         <MsgType><![CDATA[text]]></MsgType>
         <Content><![CDATA[s1]]></Content>
         <MsgId>1234567890123456</MsgId>
       </xml>
      EOF
    }


    it "should response s1" do
      post "/v1/weixin", request_s1_body
      response.status.should == 200
      puts response.body
    end

  end
end