//
//  DemoUITests.m
//  DemoUITests
//
//  Created by samiMac on 16/3/8.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DemoUITests : XCTestCase

@end

@implementation DemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *element = [[[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    [element tap];
    [[[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0] tap];
    
    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField tap];
    [element tap];
    [[[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:2] tap];
    
    XCUIElement *button = app.buttons[@"Button"];
    [button tap];
//    [app.tabBars.buttons[@"Item"] tap];
    [textField tap];
    [textField typeText:@"jhjqsdfasd"];
    [element tap];
    [button tap];
        
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


- (void)testOne
{
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *element = [[[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    [textField tap];
    [textField typeText:@"hello sam"];
    
    
    XCUIElement *textField2 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField2 tap];

//    [textField2 typeText:@"hello world"];
//    [element tap];
    [app.buttons[@"Button"] tap];
    
    XCUIElement *textField3 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:2];
    [textField3 tap];
    [textField3 tap];
//    [textField3 typeText:@"hi sam"];
    
    
    XCUIElementQuery *tabBarsQuery = app.tabBars;
    XCUIElement *itemButton = [[[tabBarsQuery childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Item"] elementBoundByIndex:1];
    [itemButton tap];
    
    XCUIElement *itemButton2 = [[[tabBarsQuery childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Item"] elementBoundByIndex:2];
    [itemButton2 tap];
    [itemButton tap];
    [[[[tabBarsQuery childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Item"] elementBoundByIndex:0] tap];
    [itemButton tap];
    
    XCUIElement *emptyListTable = app.tables[@"Empty list"];
    [emptyListTable tap];
    [emptyListTable tap];
    [emptyListTable tap];
    [emptyListTable tap];
    [itemButton2 tap];
    [emptyListTable tap];
    [emptyListTable tap];
    
}
@end
