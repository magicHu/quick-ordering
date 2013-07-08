# encoding : utf-8
require 'spec_helper'

describe WechatHelper do
  include WechatHelper

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
    params = send(:parse_request_body, request_body)
    params.size.should == 6
    params[:to_user_name].should == "quick_order"
    params[:from_user_name].should == "jobs"
    params[:create_time].should == "1348831860"
    params[:msg_type].should == "text"
    params[:content].should == "鱼香肉丝"
    params[:msg_id].should == "1234567890123456"
  end

  it "should response the text xml when have one response obj" do
    params = send(:parse_request_body, request_body)
    food1 = Food.new
    food1.id = 1
    food1.name = "food1"
    food1.price = 18.90
    text_xml = send(:to_text_xml, params, food1)
    text_xml.should_not be_empty
  end

  it "should response the text xml when have two response obj" do
    params = send(:parse_request_body, request_body)
    foods = []
    food1 = Food.new
    food1.id = 1
    food1.name = "food1"
    food1.price = 18.90
    food2 = Food.new
    food2.id = 2
    food2.name = "food2"
    food2.price = 18.90
    foods << food1 << food2
    text_xml = send(:to_text_xml, params, *foods)
    text_xml.should_not be_empty
  end

end