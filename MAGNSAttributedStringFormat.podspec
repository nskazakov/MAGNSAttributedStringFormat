Pod::Spec.new do |s|
  s.name             = 'MAGNSAttributedStringFormat'
  s.version          = '0.1.8'
  s.summary          = 'You can add multiple attributes string at the same time'

  s.description      = <<-DESC
'An extension to NSAttributedString for creating attributed strings by using a
given format string as a template into which the remaining argument values are
substituted. This is helpful for using in conjunction with internationalisation.'
                        DESC

  s.homepage         = 'https://github.com/nskazakov/MAGNSAttributedStringFormat'

  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author           = { 'Nikita Kazakov' => 'kazakov@magora-systems.com' }
  s.source           = { :git => 'https://github.com/nskazakov/MAGNSAttributedStringFormat.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MAGNSAttributedStringFormat/Classes/**/*'
  s.frameworks = 'UIKit'
end
