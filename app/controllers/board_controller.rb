require 'rmagick'

include Magick

class BoardController < ApplicationController
  def index
  end

  def write
    line = params[:line]

    image = ImageList.new('./lib/blackboard.jpg')

    draw = Draw.new
    draw.font = './lib/RiiT_F.otf'
    draw.fill = 'white'
    draw.pointsize = 40 
    draw.gravity = NorthWestGravity
    #draw.gravity = CenterGravity

    draw.annotate(image, 100, 200, 50, 180, line["0"])
    draw.annotate(image, 100, 200, 50, 230, line["1"])
    draw.annotate(image, 100, 200, 50, 280, line["2"])

    filename = "board-#{Time.now.strftime("%Y%m%d%H%M%S")}.jpg"
    #image.write("./tmp/board-#{Time.now.strftime("%Y%m%d%H%M%S")}.jpg")
    send_data(image.to_blob, :filename => filename, :type => 'image/jpg', :disposition=>'attachment') 

  end
end
