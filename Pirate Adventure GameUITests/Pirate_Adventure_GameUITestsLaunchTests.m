//
//  Pirate_Adventure_GameUITestsLaunchTests.m
//  Pirate Adventure GameUITests
//
//  Created by Vincent Moyo on 2021/10/12.
//

#import <XCTest/XCTest.h>

@interface Pirate_Adventure_GameUITestsLaunchTests : XCTestCase

@end

@implementation Pirate_Adventure_GameUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
