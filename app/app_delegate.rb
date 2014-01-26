class AppDelegate
  class GoogleMapsController < UIViewController
    def initialize(longitude, latitude)
      @longitude = longitude
      @latitude = latitude
    end
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    latitude = 38.89037
    longitude = -77.031959
    GMSServices.provideAPIKey('AIzaSyBc52my-aEvaZyCxGqzvvAUfKS9TmDFXZs')
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = GoogleMapsController.new(longitude, latitude)
    @window.makeKeyAndVisible
    true
  end
end
