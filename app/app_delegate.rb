class AppDelegate
  class GoogleMapsController < UIViewController
    def initialize(longitude, latitude)
      @longitude = longitude
      @latitude = latitude
    end

    def loadView
      camera = GMSCameraPosition.cameraWithLatitude(@latitude, longitude: @longitude, zoom: 3)
      @map_view = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
      @map_view.myLocationEnabled = true
      self.view = @map_view

      marker = GMSMarker.alloc.init
      marker.position = CLLocationCoordinate2DMake(@latitude, @longitude)
      marker.title = "Washington, D.C"
      marker.snippet = "United States"
      marker.map = @map_view
    end
  end

  def randomLocation
    prng = Random.new
    latitude = prng.rand(-90.0..90.0)
    longitude = prng.rand(-180.0..180.0)
    @window.rootViewController = GoogleMapsController.new(longitude, latitude)
    @window.makeKeyAndVisible

    @add_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @add_button.setTitle("Random Location", forState:UIControlStateNormal)
    @add_button.sizeToFit
    @add_button.frame = CGRect.new(
      [10, @window.frame.size.height - 10 - @add_button.frame.size.height],
      @add_button.frame.size)
    @add_button.addTarget(self,
                          action: 'randomLocation',
                          forControlEvents: UIControlEventTouchUpInside)
    @window.addSubview(@add_button)
  end


  def application(application, didFinishLaunchingWithOptions:launchOptions)
    latitude = 38.89037
    longitude = -77.031959
    GMSServices.provideAPIKey('AIzaSyBc52my-aEvaZyCxGqzvvAUfKS9TmDFXZs')
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = GoogleMapsController.new(longitude, latitude)
    @window.makeKeyAndVisible

    @add_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @add_button.setTitle("Random Location", forState:UIControlStateNormal)
    @add_button.sizeToFit
    @add_button.frame = CGRect.new(
      [10, @window.frame.size.height - 10 - @add_button.frame.size.height],
      @add_button.frame.size)
    @add_button.addTarget(self,
                          action: 'randomLocation',
                          forControlEvents: UIControlEventTouchUpInside)
    @window.addSubview(@add_button)

    true
  end
end
