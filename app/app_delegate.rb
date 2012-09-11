class AppDelegate

  def application(application, openURL:url, sourceApplication:sourceApplication, annotation:annotation)
    @facebook.handleOpenURL(url)
  end

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @facebook = Facebook.alloc.initWithAppId(ENV['FB_APP_ID'], andDelegate:self)

    defaults = NSUserDefaults.standardUserDefaults

    if defaults.objectForKey("FBAccessToken") && defaults.objectForKey("FBExpirationDate")
      @facebook.accessToken = defaults.objectForKey("FBAccessToken")
      @facebook.expirationDate = defaults.objectForKey("FBExpirationDate")
    end

    if @facebook.isSessionValid
      alert "Login succeeded!"
    else
      @facebook.authorize nil
    end

    true
  end

  def fbDidLogin
    defaults = NSUserDefaults.standardUserDefaults
    defaults.setObject(@facebook.accessToken, forKey:"FBAccessToken")
    defaults.setObject(@facebook.expirationDate, forKey:"FBExpirationDate")

    alert "Login succeeded!"
  end

  def fbDidNotLogin
    alert "Login failed!"
  end

  def alert(message)
    alert = UIAlertView.new
    alert.message = message
    alert.show
  end

end
