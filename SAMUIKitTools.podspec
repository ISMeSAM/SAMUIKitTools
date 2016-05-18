Pod::Spec.new do |s|

  s.name            = "SAMUIKitTools"

  s.version         = "0.0.9"
  
  s.license         = "MIT"
  
  s.summary         = "iOS development in the use of a variety of categories, a variety of tools."

  s.homepage        = "https://github.com/ISMeSAM"

  s.author          = { "Wang Yongzhen" => "wangyongzhen_wyz@163.com" }

  s.platform        = :ios, "7.0"
  
  s.source          = { :git => "https://github.com/ISMeSAM/SAMUIKitTools.git", :tag => s.version }
  
  s.source_files    = "SAMUIKitTools/*.h","SAMUIKitTools/**/*.h","SAMUIKitTools/**/**/*/{h,m,xib,nib}"

  s.resources       = "SAMUIKitTools/SAMUIKitTools.bundle"
  
  s.frameworks      = "QuartzCore","UIKit","CommonCrypto","objc","Accelerate"

  s.requires_arc    = true

  s.public_header_files = 'SAMUIKitTools/SAMUIKitTools.h',"SAMUIKitTools/SAMKeys.h"

pch_SAM = <<-EOS
#ifndef TARGET_OS_IOS
  #define TARGET_OS_IOS TARGET_OS_IPHONE
#endif
#ifndef TARGET_OS_WATCH
  #define TARGET_OS_WATCH 0
#endif
#ifndef TARGET_OS_TV
  #define TARGET_OS_TV 0
#endif
EOS
  s.prefix_header_contents = pch_SAM

  s.subspec 'Categories' do |ss|
    ss.source_files = 'SAMUIKitTools/Categories/*.h','SAMUIKitTools/Categories/**/*.{h,m}'

    ss.public_header_files = 'SAMUIKitTools/Categories/Categories.h'

    ss.subspec 'UIView' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIView/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/UIView/UIView+SAM{Extension,GestureRecognizerAction,ProgressTool,NetActivity}.h'

    end

    ss.subspec 'UINavigationBar' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UINavigationBar/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/UINavigationBar/UINavigationBar+SAMExtension.h'
    end
    
    ss.subspec 'UIScrollView' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIScrollView/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/UIScrollView/UIScrollView+SAMExtension.h'
    end

    ss.subspec 'UIControl' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIControl/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/UIControl/UIControl+SAMAddAction.h'
    end

    ss.subspec 'CALayer' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/CALayer/*.{h,m}'


      sss.public_header_files = 'SAMUIKitTools/Categories/CALayer/CALayer+SAMExtension.h'
    end

    ss.subspec 'NSArray' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/NSArray/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/NSArray/NSArray+SAMExtension.h'
    end

    ss.subspec 'NSData' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/NSData/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/NSData/NSData+SAMExtension.h'
    end

    ss.subspec 'NSDate' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/NSDate/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/NSDate/NSDate+SAMExtension.h'
    end

    ss.subspec 'NSNumber' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/NSNumber/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/NSNumber/NSNumber+SAMExtension.h'
    end
    
    ss.subspec 'NSObject' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/NSObject/*.{h,m}'
      
      sss.public_header_files = 'SAMUIKitTools/Categories/NSObject/NSObject+SAMExtension.h'
    end
      
    ss.subspec 'NSString' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/NSString/*.{h,m}'


      sss.public_header_files = 'SAMUIKitTools/Categories/NSString/NSString+SAMExtension.h'
    end
    
    ss.subspec 'UIAlertViewController' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIAlertViewController/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/UIAlertViewController/UIAlertController+SAMExtension.h'
    end

    ss.subspec 'UIApplication' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIApplication/*.{h,m}'
      
      sss.public_header_files = 'SAMUIKitTools/Categories/UIApplication/UIApplication+SAMExtension.h'
    end

    ss.subspec 'UIBarButtonItem' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIBarButtonItem/*.{h,m}'
      sss.dependency 'SAMUIKitTools/Categories/UIView'
  
      sss.public_header_files = 'SAMUIKitTools/Categories/UIBarButtonItem/UIBarButtonItem+SAMExtension.h'
    end

    ss.subspec 'UIButton' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIButton/*.{h,m}'

      
      sss.public_header_files = 'SAMUIKitTools/Categories/UIButton/UIButton+RemoveHighlightedEffect.h'
    end

    ss.subspec 'UIColor' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIColor/*.{h,m}'

      
      sss.public_header_files = 'SAMUIKitTools/Categories/UIColor/UIColor+SAMExtension.h'
    end

    ss.subspec 'UIDatePicker' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIDatePicker/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/UIDatePicker/UIDatePicker+SAMExtension.h'
    end

    ss.subspec 'UIImage' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIImage/*.{h,m}'


      sss.public_header_files = 'SAMUIKitTools/Categories/UIImage/UIImage+SAMExtension.h'
    end

    ss.subspec 'UILabel' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UILabel/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/UILabel/UILabel+SAMExtension.h'
    end

    ss.subspec 'UINavigationController' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UINavigationController/*.{h,m}'

      sss.public_header_files = 'SAMUIKitTools/Categories/UINavigationController/UINavigationController+SAMExtension.h'
    end

    ss.subspec 'UITabBarItem' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UITabBarItem/*.{h,m}'


      sss.public_header_files = 'SAMUIKitTools/Categories/UITabBarItem/UITabBarItem+SAMExtension.h'
    end

    ss.subspec 'UITableViewCell' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UITableViewCell/*.{h,m}'
      sss.dependency 'SAMUIKitTools/Categories/UIImage'

      sss.public_header_files = 'SAMUIKitTools/Categories/UITableViewCell/UITableViewCell+SAMExtension.h'
    end

    ss.subspec 'UITextView' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UITextView/*.{h,m}'


      sss.public_header_files = 'SAMUIKitTools/Categories/UITextView/UITextView+SAMExtension.h'
    end

    ss.subspec 'UIViewController' do |sss|
      sss.source_files = 'SAMUIKitTools/Categories/UIViewController/*.{h,m}'
      sss.dependency 'SAMUIKitTools/Categories/NSObject'

      sss.public_header_files = 'SAMUIKitTools/Categories/UIViewController/UIViewController+SAMExtension.h'
    end

  end

  s.subspec 'UITOOLs' do |ss|
    ss.source_files = 'SAMUIKitTools/UITOOLs/*.h','SAMUIKitTools/UITOOLs/**/*.{h,m}'
    ss.public_header_files = 'SAMUIKitTools/UITOOLs/UITOOLs.h'

    ss.subspec 'SAMSlideBar' do |sss|
      sss.source_files = 'SAMUIKitTools/UITOOLs/SAMSlideBar/*.{h,m}'
      sss.dependency 'SAMUIKitTools/Categories/NSObject'

      sss.public_header_files = 'SAMUIKitTools/UITOOLs/SAMSlideBar/SAMSlideBar.h'
    end

    ss.subspec 'SAMAlertView' do |sss|
      sss.source_files = 'SAMUIKitTools/UITOOLs/SAMAlertView/*.{h,m}'
      sss.dependency 'SAMUIKitTools/Categories/UIView'

      sss.public_header_files = 'SAMUIKitTools/UITOOLs/SAMAlertView/SAMAlertView.h'
    end

    ss.subspec 'PopToBottomView' do |sss|
      sss.source_files = 'SAMUIKitTools/UITOOLs/PopBottomView/*.{h,m}'
      sss.dependency 'SAMUIKitTools/Categories'
      
      sss.public_header_files = 'SAMUIKitTools/UITOOLs/PopToBottomView/SAMPop{To,At}BottomView.h'
    end

    ss.subspec 'CheckBoxButton' do |sss|
      sss.source_files = 'SAMUIKitTools/UITOOLs/CheckBoxButton/*.{h,m}'
      sss.dependency 'SAMUIKitTools/Categories'
      
      sss.public_header_files = 'SAMUIKitTools/UITOOLs/CheckBoxButton/CheckBoxButton.h'
    end

    ss.subspec 'PopList' do |sss|
      sss.source_files = 'SAMUIKitTools/UITOOLs/PopList/*.{h,m,xib,nib}'
      sss.dependency 'SAMUIKitTools/Categories'
      
      sss.public_header_files = 'SAMUIKitTools/UITOOLs/PopList/SAMPopLists.h'
    end

    ss.subspec 'SAMDatePicker' do |sss|
      sss.source_files = 'SAMUIKitTools/UITOOLs/SAMDatePicker/*.{h,m,xib,nib}'
      sss.dependency 'SAMUIKitTools/Categories'
      
      sss.public_header_files = 'SAMUIKitTools/UITOOLs/SAMDatePicker/SAMDatePicker.h'
    end


  end


end
