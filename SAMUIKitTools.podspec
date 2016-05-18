Pod::Spec.new do |s|

  s.name            = "SAMUIKitTools"

  s.version         = "0.0.9"
  
  s.license         = "MIT"
  
  s.summary         = "iOS development in the use of a variety of categories, a variety of tools."

  s.homepage        = "https://github.com/ISMeSAM"

  s.author          = { "Wang Yongzhen" => "wangyongzhen_wyz@163.com" }

  s.platform        = :ios, "7.0"
  
  s.source          = { :git => "https://github.com/ISMeSAM/SAMUIKitTools.git", :tag => s.version }
  
  s.source_files    = "SAMUIKitTools/SAM{UIKitTools,Keys}.h"

  s.resources       = "SAMUIKitTools/SAMUIKitTools.bundle"
  
  s.frameworks      = "QuartzCore","UIKit"

  s.requires_arc    = true

  s.public_header_files = 'SAMUIKitTools/SAMUIKitTools.h'

  s.subspec 'Categories' do |ss|
    ss.source_files = 'SAMUIKitTools/Categories/Categories.h'

    ss.public_header_files = 'SAMUIKitTools/Categories/Categories.h'

    ss.subspec 'UIView' do |ssUIView|
      ssUIView.source_files = 'SAMUIKitTools/Categories/UIView/*.{h,m}'
      ssUIView.frameworks = "QuartzCore"

      ssUIView.public_header_files = 'SAMUIKitTools/Categories/UIView/UIView+{SAMExtension,SAMGestureRecognizerAction,SAMProgressTool,SAMNetActivity}.h'

    end

    ss.subspec 'UINavigationBar' do |ssUINavigationBar|
      ssUINavigationBar.source_files = 'SAMUIKitTools/Categories/UINavigationBar/*.{h,m}'

      ssUINavigationBar.public_header_files = 'SAMUIKitTools/Categories/UINavigationBar/UINavigationBar+SAMExtension.h'
    end
    
    ss.subspec 'UIScrollView' do |ssUIScrollView|
      ssUIScrollView.source_files = 'SAMUIKitTools/Categories/UIScrollView/*.{h,m}'

      ssUIScrollView.public_header_files = 'SAMUIKitTools/Categories/UIScrollView/UIScrollView+SAMExtension.h'
    end

    ss.subspec 'UIControl' do |ssUIControl|
      ssUIControl.source_files = 'SAMUIKitTools/Categories/UIControl/*.{h,m}'

      ssUIControl.public_header_files = 'SAMUIKitTools/Categories/UIControl/UIControl+SAMAddAction.h'
    end

    ss.subspec 'CALayer' do |ssCALayer|
      ssCALayer.source_files = 'SAMUIKitTools/Categories/CALayer/*.{h,m}'
      ssCALayer.frameworks = "QuartzCore"

      ssCALayer.public_header_files = 'SAMUIKitTools/Categories/CALayer/CALayer+SAMExtension.h'
    end

    ss.subspec 'NSArray' do |ssNSArray|
      ssNSArray.source_files = 'SAMUIKitTools/Categories/NSArray/*.{h,m}'

      ssNSArray.public_header_files = 'SAMUIKitTools/Categories/NSArray/NSArray+SAMExtension.h'
    end

    ss.subspec 'NSData' do |ssNSData|
      ssNSData.source_files = 'SAMUIKitTools/Categories/NSData/*.{h,m}'
      ssNSData.frameworks = "CommonCrypto"

      ssNSData.public_header_files = 'SAMUIKitTools/Categories/NSData/NSData+SAMExtension.h'
    end

    ss.subspec 'NSDate' do |ssNSDate|
      ssNSDate.source_files = 'SAMUIKitTools/Categories/NSDate/*.{h,m}'

      ssNSDate.public_header_files = 'SAMUIKitTools/Categories/NSDate/NSDate+SAMExtension.h'
    end

    ss.subspec 'NSNumber' do |ssNSNumber|
      ssNSNumber.source_files = 'SAMUIKitTools/Categories/NSNumber/*.{h,m}'

      ssNSNumber.public_header_files = 'SAMUIKitTools/Categories/NSNumber/NSNumber+SAMExtension.h'
    end
    
    ss.subspec 'NSObject' do |ssNSObject|
      ssNSObject.source_files = 'SAMUIKitTools/Categories/NSObject/*.{h,m}'
      
      ssNSObject.public_header_files = 'SAMUIKitTools/Categories/NSObject/NSObject+SAMExtension.h'
    end
      
    ss.subspec 'NSString' do |ssNSString|
      ssNSString.source_files = 'SAMUIKitTools/Categories/NSString/*.{h,m}'
      ssNSString.frameworks = "CommonCrypto"

      ssNSString.public_header_files = 'SAMUIKitTools/Categories/NSString/NSString+SAMExtension.h'
    end
    
    ss.subspec 'UIAlertViewController' do |ssUIAlertViewController|
      ssUIAlertViewController.source_files = 'SAMUIKitTools/Categories/UIAlertViewController/*.{h,m}'

      ssUIAlertViewController.public_header_files = 'SAMUIKitTools/Categories/UIAlertViewController/UIAlertController+SAMExtension.h'
    end

    ss.subspec 'UIApplication' do |ssUIApplication|
      ssUIApplication.source_files = 'SAMUIKitTools/Categories/UIApplication/*.{h,m}'
      
      ssUIApplication.public_header_files = 'SAMUIKitTools/Categories/UIApplication/UIApplication+SAMExtension.h'
    end

    ss.subspec 'UIBarButtonItem' do |ssUIBarButtonItem|
      ssUIBarButtonItem.source_files = 'SAMUIKitTools/Categories/UIBarButtonItem/*.{h,m}'
      ssUIBarButtonItem.dependency 'SAMUIKitTools/Categories/UIView'
  
      ssUIBarButtonItem.public_header_files = 'SAMUIKitTools/Categories/UIBarButtonItem/UIBarButtonItem+SAMExtension.h'
    end

    ss.subspec 'UIButton' do |ssUIButton|
      ssUIButton.source_files = 'SAMUIKitTools/Categories/UIButton/*.{h,m}'
      ssUIButton.frameworks = 'objc'
      
      ssUIButton.public_header_files = 'SAMUIKitTools/Categories/UIButton/UIButton+RemoveHighlightedEffect.h'
    end

    ss.subspec 'UIColor' do |ssUIColor|
      ssUIColor.source_files = 'SAMUIKitTools/Categories/UIColor/*.{h,m}'
      ssUIColor.frameworks = 'objc'
      
      ssUIColor.public_header_files = 'SAMUIKitTools/Categories/UIColor/UIColor+SAMExtension.h'

    end

    ss.subspec 'UIDatePicker' do |ssUIDatePicker|
      ssUIDatePicker.source_files = 'SAMUIKitTools/Categories/UIDatePicker/*.{h,m}'

      ssUIDatePicker.public_header_files = 'SAMUIKitTools/Categories/UIDatePicker/UIDatePicker+SAMExtension.h'
    end

    ss.subspec 'UIImage' do |ssUIImage|
      ssUIImage.source_files = 'SAMUIKitTools/Categories/UIImage/*.{h,m}'
      ssUIImage.frameworks = 'Accelerate'

      ssUIImage.public_header_files = 'SAMUIKitTools/Categories/UIImage/UIImage+SAMExtension.h'
    end

    ss.subspec 'UILabel' do |ssUILabel|
      ssUILabel.source_files = 'SAMUIKitTools/Categories/UILabel/*.{h,m}'

      ssUILabel.public_header_files = 'SAMUIKitTools/Categories/UILabel/UILabel+SAMExtension.h'
    end

    ss.subspec 'UINavigationController' do |ssUINavigationController|
      ssUINavigationController.source_files = 'SAMUIKitTools/Categories/UINavigationController/*.{h,m}'

      ssUINavigationController.public_header_files = 'SAMUIKitTools/Categories/UINavigationController/UINavigationController+SAMExtension.h'
    end

    ss.subspec 'UITabBarItem' do |ssUITabBarItem|
      ssUITabBarItem.source_files = 'SAMUIKitTools/Categories/UITabBarItem/*.{h,m}'
      ssUITabBarItem.frameworks = 'objc'

      ssUITabBarItem.public_header_files = 'SAMUIKitTools/Categories/UITabBarItem/UITabBarItem+SAMExtension.h'
    end

    ss.subspec 'UITableViewCell' do |ssUITableViewCell|
      ssUITableViewCell.source_files = 'SAMUIKitTools/Categories/UITableViewCell/*.{h,m}'
      ssUITableViewCell.dependency 'SAMUIKitTools/Categories/UIImage'

      ssUITableViewCell.public_header_files = 'SAMUIKitTools/Categories/UITableViewCell/UITableViewCell+SAMExtension.h'
    end

    ss.subspec 'UITextView' do |ssUITextView|
      ssUITextView.source_files = 'SAMUIKitTools/Categories/UITextView/*.{h,m}'
      ssUITextView.frameworks = 'objc'

      ssUITextView.public_header_files = 'SAMUIKitTools/Categories/UITextView/UITextView+SAMExtension.h'
    end

    ss.subspec 'UIViewController' do |ssUIViewController|
      ssUIViewController.source_files = 'SAMUIKitTools/Categories/UIViewController/*.{h,m}'
      ssUIViewController.dependency 'SAMUIKitTools/Categories/NSObject'

      ssUIViewController.public_header_files = 'SAMUIKitTools/Categories/UIViewController/UIViewController+SAMExtension.h'
    end

  end

  s.subspec 'UITOOLs' do |ss|
    ss.source_files = 'SAMUIKitTools/UITOOLs/UITOOLs.h'
    ss.public_header_files = 'SAMUIKitTools/UITOOLs/UITOOLs.h'

    ss.subspec 'SAMSlideBar' do |ssSAMSlideBar|
      ssSAMSlideBar.source_files = 'SAMUIKitTools/UITOOLs/SAMSlideBar/*.{h,m}'
      ssSAMSlideBar.dependency 'SAMUIKitTools/Categories/NSObject'

      ssSAMSlideBar.public_header_files = 'SAMUIKitTools/UITOOLs/SAMSlideBar/SAMSlideBar.h'
    end

    ss.subspec 'SAMAlertView' do |sss|
      sss.source_files = 'SAMUIKitTools/UITOOLs/SAMAlertView/*.{h,m}'
      sss.dependency 'SAMUIKitTools/Categories/UIView'
      sss.dependency 'SAMUIKitTools/SAMKeys.h'

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
