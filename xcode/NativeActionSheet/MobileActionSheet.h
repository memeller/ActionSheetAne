//
//  MobileActionSheet.h
//  NativeActionSheet
//
//  Created by Anthony McCormick on 22/10/2011, modified by Pawel Meller on 02/2012 - just converting this to ActionSheet :)
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "FlashRuntimeExtensions.h"

@interface MobileActionSheet : NSObject <UIActionSheetDelegate>

@property( nonatomic, retain ) UIActionSheet *action;

-(void)showActionSheet: (NSString *)title 
               closeLabel: (NSString*)closeLabel
         destructiveLabel: (NSString*)destructiveLabel
              otherLabels: (NSString*)otherLabels
                  context: (FREContext *)context;
-(void)showActionSheetFromRect: (NSString *)title 
                    closeLabel: (NSString*)closeLabel
              destructiveLabel: (NSString*)destructiveLabel
                   otherLabels: (NSString*)otherLabels                       
                          xPos: (CGFloat)x
                          yPos: (CGFloat)y
                      widthPos: (CGFloat)width
                     heightPos: (CGFloat)height
context: (FREContext *)ctx;
@end
