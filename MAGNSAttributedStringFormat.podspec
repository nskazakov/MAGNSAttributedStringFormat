Pod::Spec.new do |s|
  s.name             = 'MAGNSAttributedStringFormat'
  s.version          = '0.1.0'
  s.summary          = 'It makes for convenient formatting of string attributed in the swift.'

  s.description      = <<-DESC
'MAGNSAttributedStringFormat may simplify the work with attributes string.'
                        DESC

  s.homepage         = 'https://github.com/nskazakov/MAGNSAttributedStringFormat'

  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author           = { 'Nikita Kazakov' => 'kazakov@magora-systems.com' }
  s.source           = { :git => 'https://github.com/nskazakov/MAGNSAttributedStringFormat.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MAGNSAttributedStringFormat/Classes/**/*'
  s.frameworks = 'UIKit'
end
