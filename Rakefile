# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'RubyMotionFacebookLoginSample'
  app.info_plist['CFBundleURLTypes'] = [{'CFBundleURLSchemes' => ["fb#{ENV['FB_APP_ID']}"]}]

  app.pods do
    pod 'Facebook-iOS-SDK'
  end

end
