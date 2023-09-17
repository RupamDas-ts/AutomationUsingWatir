require 'watir'
# require 'selenium-webdriver'

def setup
  "" "
      Setup remote driver
      Params
      ----------
      platform : Supported platform - (Windows 10, Windows 8.1, Windows 8, Windows 7,  macOS High Sierra, macOS Sierra, OS X El Capitan, OS X Yosemite, OS X Mavericks)
      browserName : Supported platform - (chrome, firefox, Internet Explorer, MicrosoftEdge)
      version :  Supported list of version can be found at https://www.lambdatest.com/capabilities-generator/

      Result
      -------
      " ""
  username = "rupamd"
  accessToken = "g8bSPewKA2UPOBkcfGMcv1Vmc8N9CM11gIDUUyL9q9a8OpxUwc"
  gridUrl = "hub.lambdatest.com/wd/hub"
  caps = Selenium::WebDriver::Remote::Capabilities.new
  caps[:browserName] = "chrome"
  caps[:version] = "116.0"
  caps[:platform] = "win10"
  caps[:name] = "LambdaTest Watir Signup Page Name verification"
  caps[:build] = "LambdaTest Watir Signup Page Name verification"
  caps[:network] = true
  caps[:visual] = true
  caps[:video] = true
  caps[:console] = true
  chrome_options = Selenium::WebDriver::Chrome::Options.new

  # Set the ChromeOptions as the 'options' in capabilities
  caps[:options] = chrome_options

  puts(caps)
  # URL: https://{username}:{accessToken}@hub.lambdatest.com/wd/hub
  # @browser = Watir::Browser.new(:remote, :url => "https://" + username + ":" + accessToken + "@" + gridUrl,
  #                    :desired_capabilities => caps)

  driver = Selenium::WebDriver.for(:remote, url: "https://" + username + ":" + accessToken + "@" + gridUrl, options: caps)

  @browser = Watir::Browser.new(driver)
end
def performActions
  @browser.goto("https://the-internet.herokuapp.com/checkboxes")
  element1 = @browser.element(css:"#checkboxes input:first-child")
  element1.click
  element2 = @browser.element(css:"#checkboxes :nth-child(3)")
  element2.click
end

def quit
  @browser.quit
end

setup
performActions
quit