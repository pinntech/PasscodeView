Pod::Spec.new do |s|
  s.name             = "PasscodeView"
  s.version          = "0.1.0"
  s.summary          = "An iOS inspired secure passcode entry view."
  
  s.description      = <<-DESC
    PasscodeView is an easy to use and confiure custom view that is perfect for
    displaying results of a secure entry field like a PIN or password. It is inspired by the
    iOS passcode screen that is used for unlocking devices. It is both IBDesignable and IBInspectable
    which makes it simple to use and configure for your own project.
                       DESC

  s.homepage         = "https://github.com/pinnrepo/PasscodeView"
  s.license          = 'MIT'
  s.author           = { "David Westerhoff" => "dmwesterhoff@gmail.com" }
  s.source           = { :git => "https://github.com/pinnrepo/PasscodeView.git", :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.source_files = 'PasscodeView/*'
  s.frameworks = 'UIKit'
end
