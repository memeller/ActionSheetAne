//
//  MobileActionSheet.m
//  NativeActionSheet
//
//  Created by Anthony McCormick on 22/10/2011. , modified by Pawel Meller on 02/2012 - just converting this to ActionSheet :)
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MobileActionSheet.h"

@implementation MobileActionSheet

@synthesize action;

FREContext *context;

-(void)showActionSheet: (NSString *)title 
               closeLabel: (NSString*)closeLabel
            destructiveLabel: (NSString*)destructiveLabel
              otherLabels: (NSString*)otherLabels
                  context: (FREContext *)ctx
{
    //Hold onto the context so we can dispatch our message later.
    context = ctx;
    
    //Create our alert.
    self.action = [[[UIActionSheet alloc] initWithTitle:title 
                                                   delegate:self 
                                          cancelButtonTitle:closeLabel
                                destructiveButtonTitle:destructiveLabel
                                          otherButtonTitles:nil] retain];
    //Split our labels into an array
    NSArray *labels = [otherLabels componentsSeparatedByString:@","];
    
    //Add each label to our array.
    for (NSString *label in labels) 
    {
        [action addButtonWithTitle:label];
    }
    [action showInView:[[UIApplication sharedApplication] keyWindow] ];
}
-(void)showActionSheetFromRect: (NSString *)title 
               closeLabel: (NSString*)closeLabel
            destructiveLabel: (NSString*)destructiveLabel
              otherLabels: (NSString*)otherLabels                 
                        xPos: (CGFloat)x
                        yPos: (CGFloat)y
                    widthPos: (CGFloat)width
                    heightPos: (CGFloat)height
                       context: (FREContext *)ctx
{
    //Hold onto the context so we can dispatch our message later.
    context = ctx;
    
    //Create our alert.
    self.action = [[[UIActionSheet alloc] initWithTitle:title 
                                                   delegate:self 
                                          cancelButtonTitle:closeLabel
                                destructiveButtonTitle:destructiveLabel
                                          otherButtonTitles:nil] retain];
    //Split our labels into an array
    NSArray *labels = [otherLabels componentsSeparatedByString:@","];
    
    //Add each label to our array.
    for (NSString *label in labels) 
    {
        [action addButtonWithTitle:label];
    }
    [action showFromRect:CGRectMake(x,y,width,height) inView:[[UIApplication sharedApplication] keyWindow] animated:YES];
}	
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    //Create our params to pass to the event dispatcher.
    NSString *buttonID = [NSString stringWithFormat:@"%d", buttonIndex];
    //This is the event name we will use in actionscript to know it is our 
    //event that was dispatched.
    NSString *event_name = @"ALERT_CLOSED";
    
    FREDispatchStatusEventAsync(context, (uint8_t*)[event_name UTF8String], (uint8_t*)[buttonID UTF8String]);
    //Cleanup references.
    [action release];
    context = nil;
}

@end
