
Pod::Spec.new do |s|

  s.name         = "ATRLogFormatter"
  s.version      = "1.0"
  s.summary      = "Simple log formatter for using CocoaLimberjack library"
  s.description  = "Simple log formatter for using CocoaLimberjack library (https://github.com/CocoaLumberjack/CocoaLumberjack)"
  s.homepage     = "https://github.com/alphatroya/ATRLogFormatter"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = { :type => 'GPL', :file => 'LICENSE' }
  s.author             = { "Alexey Korolev" => "alphatroya@gmail.com" }
  s.source       = { :git => "https://github.com/alphatroya/ATRLogFormatter.git", :tag => s.version.to_s }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.requires_arc = true
  s.dependency "CocoaLumberjack", "~>1.9.1"

end
