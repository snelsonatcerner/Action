//
//  MoveButton.m
//  game2d
//
//  Created by Mara Nelson on 1/19/14.
//  Copyright (c) 2014 Mara Nelson. All rights reserved.
//

#import "MoveButton.h"

@implementation MoveButton

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.isPressed = YES;
}

-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.isPressed = NO;
}

-(void)touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.isPressed = NO;
}


@end
