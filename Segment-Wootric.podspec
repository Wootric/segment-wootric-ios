Pod::Spec.new do |s|
  s.name             = "Segment-Wootric"
  s.module_name      = "SegmentWootric"
  s.version          = "0.3.1"
  s.summary          = "Wootric integration for Segment's analytics-ios library."

  s.description      = <<-DESC
                       This is the Wootric integration for the iOS Analytics library.
                       DESC

  s.homepage          = "https://www.wootric.com"
  s.license           = { :type => 'MIT', :file => 'LICENSE.md' }
  s.documentation_url = "http://docs.wootric.com/ios/"
  s.authors           = { 'Wootric' => 'support@wootric.com' }
  s.source            = { :git => "https://github.com/Wootric/segment-wootric-ios.git", :tag => s.version.to_s }

  s.platform     = :ios, '10.0'
  s.requires_arc = true

  s.source_files = 'Segment-Wootric/*.{h,m}'
  s.public_header_files = 'Segment-Wootric/SegmentWootric.h',
                          'Segment-Wootric/WTRWootricIntegration.h',
                          'Segment-Wootric/WTRWootricIntegrationFactory.h'

  s.dependency 'Analytics', '~> 4.1.1'
  s.dependency 'WootricSDK', '~> 0.19.1'
end
