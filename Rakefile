# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'gmaps_ruby_motion'
  app.archs['iPhoneOS'] = ['armv7']
  app.vendor_project('vendor/GoogleMaps.framework',
    :static,
    :products    => %w{GoogleMaps},
    :headers_dir => 'Headers')
  app.resources_dirs << 'vendor/GoogleMaps.framework/Resources'
  app.frameworks += %w{AVFoundation CoreData CoreLocation CoreText GLKit ImageIO OpenGLES QuartzCore SystemConfiguration}
  app.libs       += %w{/usr/lib/libicucore.dylib /usr/lib/libc++.dylib /usr/lib/libz.dylib}
end
