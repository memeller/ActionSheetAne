//
//  NativeActionSheet.m
//  NativeActionSheet
//
//  Created by Anthony McCormick on 22/10/2011, modified by Pawel Meller on 02/2012 - just converting this to ActionSheet :)
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
//#import <Foundation/Foundation.h>
#include "FlashRuntimeExtensions.h"
//#import <UIKit/UIKit.h>
#import "MobileActionSheet.h"


FREObject showActionSheet(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[] )
{
    //Temporary values to hold our actionscript code.
    uint32_t titleLength;
    const uint8_t *title;
    uint32_t destructiveLength;
    const uint8_t *destructive;
    uint32_t closeLength;
    const uint8_t *closeLabel;
    uint32_t otherLength;
    const uint8_t *otherLabels;
    
    //Turn our actionscrpt code into native code.
    FREGetObjectAsUTF8(argv[0], &titleLength, &title);
    FREGetObjectAsUTF8(argv[1], &closeLength, &closeLabel);
    FREGetObjectAsUTF8(argv[2], &destructiveLength, &destructive);
    FREGetObjectAsUTF8(argv[3], &otherLength, &otherLabels);
    
    //Create our Strings for our Alert.
    NSString *titleString = [NSString stringWithUTF8String:(char*)title];
    NSString *closeLabelString = [NSString stringWithUTF8String:(char*)closeLabel];    
    NSString *destructiveString = [NSString stringWithUTF8String:(char*)destructive];
    NSString *otherLabelsString = [NSString stringWithUTF8String:(char*)otherLabels];    
    
    
    
    MobileActionSheet *action = [[MobileActionSheet alloc] init];
    [action showActionSheet:titleString 
                   closeLabel:closeLabelString
                  destructiveLabel:destructiveString 
                  otherLabels:otherLabelsString
                      context:ctx];
    return NULL;    
}

FREObject showActionSheetFromRect(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[] )
{
    //Temporary values to hold our actionscript code.
    uint32_t titleLength;
    const uint8_t *title;
    uint32_t destructiveLength;
    const uint8_t *destructive;
    uint32_t closeLength;
    const uint8_t *closeLabel;
    uint32_t otherLength;
    const uint8_t *otherLabels;

    double xPos;
    double yPos;
    double widthPos;
    double heightPos;
    //Turn our actionscrpt code into native code.
    FREGetObjectAsUTF8(argv[0], &titleLength, &title);
    FREGetObjectAsUTF8(argv[1], &closeLength, &closeLabel);
    FREGetObjectAsUTF8(argv[2], &destructiveLength, &destructive);
    FREGetObjectAsUTF8(argv[3], &otherLength, &otherLabels);
    FREGetObjectAsDouble(argv[4], &xPos);
    FREGetObjectAsDouble(argv[5], &yPos);
    FREGetObjectAsDouble(argv[6], &widthPos);
    FREGetObjectAsDouble(argv[7],  &heightPos);
    //Create our Strings for our Alert.
    NSString *titleString = [NSString stringWithUTF8String:(char*)title];
    NSString *closeLabelString = [NSString stringWithUTF8String:(char*)closeLabel];    
    NSString *destructiveString = [NSString stringWithUTF8String:(char*)destructive];
    NSString *otherLabelsString = [NSString stringWithUTF8String:(char*)otherLabels];    
    CGFloat xPosString = xPos;
    CGFloat yPosString = yPos;
    CGFloat widthPosString = widthPos;
    CGFloat heightPosString = heightPos;
    
    
    
    MobileActionSheet *action = [[MobileActionSheet alloc] init];
    [action  showActionSheetFromRect:titleString 
                 closeLabel:closeLabelString
           destructiveLabel:destructiveString 
                otherLabels:otherLabelsString
                       xPos:xPosString
                       yPos:yPosString
                   widthPos:widthPosString
                  heightPos:heightPosString
                         context:ctx
     
     ];
    return NULL;    
}

  
//------------------------------------
//
// Required Methods.
//
//------------------------------------

// ActionSheetContextInitializer()
//
// The context initializer is called when the runtime creates the extension context instance.
void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, 
						uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) 
{
    
	*numFunctionsToTest = 2;
    
	FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * 1);
	func[0].name = (const uint8_t*) "showActionSheet";
	func[0].functionData = NULL;
    func[0].function = &showActionSheet;
    func[1].name = (const uint8_t*) "showActionSheetFromRect";
	func[1].functionData = NULL;
    func[1].function = &showActionSheetFromRect;

	*functionsToSet = func;
}

// ContextFinalizer()
//
// The context finalizer is called when the extension's ActionScript code
// calls the ExtensionContext instance's dispose() method.
// If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls
// ContextFinalizer().

void ContextFinalizer(FREContext ctx) {
    
    NSLog(@"Entering ActionSheetContextFinalizer()");
    
    // Nothing to clean up.
    
    NSLog(@"Exiting ActionSheetContextFinalizer()");
    
	return;
}

// ActionSheetExtInitializer()
//
// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.

void ActionSheetExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, 
                    FREContextFinalizer* ctxFinalizerToSet) {
    
    NSLog(@"Entering ActionSheetExtInitializer()");
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &ContextInitializer;
    *ctxFinalizerToSet = &ContextFinalizer;
    
    NSLog(@"Exiting ActionSheetExtInitializer()");
}

// ExtFinalizer()
//
// The extension finalizer is called when the runtime unloads the extension. However, it is not always called.

void ActionSheetExtFinalizer(void* extData) {
    
    NSLog(@"Entering ActionSheetExtFinalizer()");
    
    // Nothing to clean up.
    
    NSLog(@"Exiting ActionSheetExtFinalizer()");
    return;
}