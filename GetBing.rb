#!/usr/bin/env ruby
#encoding=UTF-8

require 'nokogiri'
require 'open-uri'

class Get_bing_img

  attr_accessor:n
  attr_accessor:mkt

  DOWNLOAD_PATH = "/home/icysmiles/图片/桌面"
  BING = "www.bing.com"
  IMG_STR1 = "http://s.cn.bing.net"
  #IMG_URL = "http://cn.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=#{n}&mkt=#{mkt}"
  IMG_URL_CN = "http://cn.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=ZH-CN"
  #MARKETS = ["en-US","zh-CN","ja-JP","en-AU","en-UK","de-DE","en-NZ","en-CA"]
  #NUMBERS_OF_IMAGES = 1

  def self.get_img

    today = Time.new.strftime("%Y%m%d")

    doc = Nokogiri::HTML(open(IMG_URL_CN))
    date_msg = doc.search("//images/image/enddate").text
 
    if today == date_msg 
      img_str2 = doc.search("//images/image/url").text
      img_location = IMG_STR1 << img_str2
      Dir.chdir(DOWNLOAD_PATH)
      system("wget -t 10 -nc " << img_location << " -O" << "#{today}.jpg" )
    end  
  end

end

Get_bing_img.get_img
