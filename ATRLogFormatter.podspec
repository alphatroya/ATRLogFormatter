
Pod::Spec.new do |s|

	s.name         		= "ATRLogFormatter"
	s.version      		= "1.6"
	s.ios.deployment_target = '8.0'
	s.summary      		= "Simple log formatter for using CocoaLimberjack library"
	s.description  		= "Simple log formatter for using CocoaLimberjack library (https://github.com/CocoaLumberjack/CocoaLumberjack)"
	s.homepage     		= "https://github.com/alphatroya/ATRLogFormatter"
	s.license      		= { :type => 'MIT', :file => 'LICENSE' }
	s.author        	= { "Alexey Korolev" => "alphatroya@gmail.com" }
	s.source       		= { :git => "https://github.com/alphatroya/ATRLogFormatter.git", :tag => s.version.to_s }
	s.source_files  	= "Sources/Classes/"
	s.requires_arc 		= true
	s.dependency "CocoaLumberjack", "~>3.0.0"


end
