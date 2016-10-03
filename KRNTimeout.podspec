Pod::Spec.new do |s|

  s.name         = "KRNTimeout"
  s.version      = "0.0.1"
  s.summary      = "An Objective C class that simplifies using timeouts during iOS-development"

  s.homepage     = "https://github.com/ulian-onua/KRNTimeout"

  s.license      = { :type => "MIT", :file => "LICENSE" }



  s.author             = { "Julian Drapaylo" => "ulian.onua@gmail.com" }
#s.social_media_url   = "http://www.linkedin.com/in/julian-drapaylo"



  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ulian-onua/KRNTimeout.git", :tag => "0.0.1" }


  s.source_files  = "KRNTimeout/*.{h,m}"
  s.public_header_files = "KRNTimeout/*.h"

  s.framework = "Foundation"


  s.requires_arc = true


end
