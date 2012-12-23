module Kernel
  def play
    $player.play
  end

  def pause
    $player.pause
  end
end

class VC < UIViewController
  def viewDidLoad
    $player = PlayerView.new
    $player.frame = self.view.bounds
    self.view.addSubview $player
    $player.load
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
    @window.rootViewController = VC.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
