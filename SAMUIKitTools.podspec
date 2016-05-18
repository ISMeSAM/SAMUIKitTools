Pod::Spec.new do |s|

  s.name            = "SAMUIKitTools"

  s.version         = "0.0.6"
  
  s.license         = "MIT"
  
  s.summary         = "iOS development in the use of a variety of categories, a variety of tools."

  s.homepage        = "https://github.com/ISMeSAM"

  s.author          = { "Wang Yongzhen" => "wangyongzhen_wyz@163.com" }

  s.platform        = :ios, "7.0"
  
  s.source          = { :git => "https://github.com/ISMeSAM/SAMUIKitTools.git", :tag => s.version }
  
  s.source_files    = "SAMUIKitTools","SAMUIKitTools/**","SAMUIKitTools/**/**","SAMUIKitTools/**/*.h","SAMUIKitTools/**/**/*.{h,m}"

  s.resources       = "SAMUIKitTools/SAMUIKitTools.bundle"
  
  s.frameworks      = "QuartzCore","UIKit"

  s.requires_arc    = true

end
