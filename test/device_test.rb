require File.expand_path('helper/bootstrap', File.dirname(__FILE__))

describe Airstream::Device do

  describe "when a video file is set" do
    it "a title shoud be read from filename" do
      reciever = MiniTest::Mock.new
      reciever.expect :send_video, true, ["http://example.com/my-birthday-2010.mp4"]
      device = Airstream::Device.new reciever
      video = MiniTest::Mock.new
      video.expect :url, "http://example.com/my-birthday-2010.mp4"
      video.expect :to_s, "my-birthday-2010"
      device.video = video
      device.video_title.must_equal "my-birthday-2010"
    end
  end
end
