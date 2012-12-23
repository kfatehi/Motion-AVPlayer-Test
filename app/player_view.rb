class PlayerView < UIView
  def self.layerClass
    AVPlayerLayer
  end

  OPTIONS = {
    AVURLAssetPreferPreciseDurationAndTimingKey => NSNumber.numberWithBool(true)
  }

  def load
    urlstr = "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8"
    url = NSURL.URLWithString(urlstr)
    url_asset = AVURLAsset.URLAssetWithURL(url, options:OPTIONS)
    player_item = AVPlayerItem.playerItemWithAsset(url_asset)
    if player
      player.replaceCurrentItemWithPlayerItem(player_item)
    else
      layer.setPlayer AVPlayer.playerWithPlayerItem(player_item)
    end
  end

  def player
    self.layer.player
  end

  def setVideoFillMode fillMode
    self.layer.videoGravity = fillMode
  end

  def video_track
    player.currentItem.asset.tracksWithMediaType(AVMediaTypeVideo).lastObject
  end

  def timescale
    video_track.naturalTimeScale
  end

  def seek_to seconds
    time = CMTimeMakeWithSeconds(seconds, timescale)
    player.seekToTime(time, toleranceBefore:KCMTimeZero, toleranceAfter:KCMTimeZero)
  end
  
  def play
    player.play
  end

  def pause
    player.pause
  end

  def seconds
    CMTimeGetSeconds(player.currentTime)
  end
end