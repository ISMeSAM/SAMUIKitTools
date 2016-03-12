//
//  SAMKeys.h
//  Demo
//
//  Created by samiMac on 16/3/12.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#ifndef SAMKeys_h
#define SAMKeys_h

#ifndef FUNC_PRINT
#define FUNC_PRINT NSLog(@"%s",__func__);
#endif

#ifndef KEY_WINDOW
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow
#endif

#ifndef DEFAULT_CENTER
#define DEFAULT_CENTER  [NSNotificationCenter defaultCenter]
#endif

#ifndef RGB
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#endif

#ifndef RGB_alpha
#define RGB_alpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#endif

#ifndef Print_Function
#define Print_Function FUNC_PRINT
#endif

#ifndef MAIN_SCREEN
#define MAIN_SCREEN [UIScreen mainScreen]
#endif

#ifndef USER_DEFAULT
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#endif

#ifndef CURRENT_RUNLOOP
#define CURRENT_RUNLOOP NSLog(@"%@",[NSRunLoop currentRunLoop]);
#endif

#ifndef APPLICATION
#define APPLICATION [UIApplication sharedApplication]
#endif

#ifndef SYS_FONT
#define SYS_FONT(x) [UIFont systemFontOfSize:(x)]
#endif

#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#endif

#ifndef WeakSelf
#define WeakSelf \
__weak typeof(self) weakSelf = self;
#endif

#ifndef SBCtrlInstantiate
#define SBCtrlInstantiate(name) \
[[UIStoryboard storyboardWithName:name bundle:nil] instantiateInitialViewController]
#endif

#ifndef SBCtrlInstantiateId
#define SBCtrlInstantiateId(name,sbid) \
[[UIStoryboard storyboardWithName:(name) bundle:nil] instantiateViewControllerWithIdentifier:(sbid)]
#endif



#endif /* SAMKeys_h */


