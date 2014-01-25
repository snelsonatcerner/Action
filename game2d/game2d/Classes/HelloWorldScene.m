//
//  HelloWorldScene.m
//  game2d
//
//  Created by Mara Nelson on 12/25/13.
//  Copyright Mara Nelson 2013. All rights reserved.
//
// -----------------------------------------------------------------------

#import "HelloWorldScene.h"
#import "IntroScene.h"
#import "CCDirector.h"
#import "MoveButton.h"

CCSprite *seeker1;
CCSprite *cocosGuy;
CCButton *leftButton;
CCButton *rightButton;
CCButton *jumpButton;

// -----------------------------------------------------------------------
#pragma mark - HelloWorldScene
// -----------------------------------------------------------------------

@implementation HelloWorldScene
{
    CCLabelTTF *_helloLabel;
    float _runtime;
}

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (HelloWorldScene *)scene
{
    return [[self alloc] init];
}

// -----------------------------------------------------------------------

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    // Crash if basic initialization for some reason failed
    NSAssert(self, @"Unable to create class HelloWorldScene");
    
    // Here is where custom code for the scene starts
    _runtime = 0;
    
    // create a lebal on the centre of the sceen
//    _helloLabel = [CCLabelTTF labelWithString:@"Hello World (v3)" fontName:@"Arial" fontSize:48];
//    _helloLabel.positionType = CCPositionTypeNormalized;
//    _helloLabel.position = ccp(0.5f, 0.8f);
//    [self addChild:_helloLabel];
//    
    
    // create a left button
    leftButton = [CCButton buttonWithTitle:@"[ L ]"];
    leftButton.positionType = CCPositionTypeNormalized;
    leftButton.position = ccp(0.2f, 0.1f);
    [self addChild:leftButton];

    // create a right button
    rightButton = [CCButton buttonWithTitle:@"[ R ]"];
    rightButton.positionType = CCPositionTypeNormalized;
    rightButton.position = ccp(0.3f, 0.1f);
    [self addChild:rightButton];

    // create a jump button
    jumpButton = [CCButton buttonWithTitle:@"[ J ]"];
    jumpButton.positionType = CCPositionTypeNormalized;
    jumpButton.position = ccp(0.8f, 0.1f);
    [jumpButton setTarget:self selector:@selector(onJumpClicked:)];
    [self addChild:jumpButton];

    // create and initialize our seeker sprite, and add it to this layer
    seeker1 = [CCSprite spriteWithImageNamed: @"seeker.png"];
    seeker1.position = ccp( 50, 100 );
    [self addChild:seeker1];
    
    // do the same for our cocos2d guy, reusing the app icon as its image
    cocosGuy = [CCSprite spriteWithImageNamed: @"Icon.png"];
    cocosGuy.position = ccp( 200, 300 );
    [self addChild:cocosGuy];
    
    self.userInteractionEnabled = YES;
    
    // done
	return self;
}
//
//-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
//{
//}
//
//-(void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    CGPoint location = [touch locationInNode:self];
//
//
//	[cocosGuy stopAllActions];
//    
//	[cocosGuy runAction: [CCActionMoveTo actionWithDuration:.5 position:location]];
//}

- (void)update:(CCTime)dt
{
    if (leftButton.touchInside)
    {
        seeker1.position = ccp( seeker1.position.x - 100*dt, seeker1.position.y );
        if (seeker1.position.x < 0)
        {
            seeker1.position = ccp( 480+32, seeker1.position.y );
        }
    }
    else if (rightButton.touchInside)
    {
        seeker1.position = ccp( seeker1.position.x + 100*dt, seeker1.position.y );
        if (seeker1.position.x > 480+32)
        {
            seeker1.position = ccp( -32, seeker1.position.y );
        }
    }
}

// -----------------------------------------------------------------------

- (void)dealloc
{
    // clean up code goes here
}

// -----------------------------------------------------------------------
#pragma mark - Enter & Exit
// -----------------------------------------------------------------------

- (void)onEnter
{
    // always call super onEnter first
    [super onEnter];
    
    // In pre-v3, touch enable and scheduleUpdate was called here
    // In v3, touch is enabled by setting userInterActionEnabled for the individual nodes
    // Pr frame update is automatically enabled, if update is overridden
    
}

// -----------------------------------------------------------------------

- (void)onExit
{
    
    
    // always call super onExit last
    [super onExit];
}

// -----------------------------------------------------------------------
#pragma mark - update
// -----------------------------------------------------------------------


// -----------------------------------------------------------------------
#pragma mark - Button Callbacks
// -----------------------------------------------------------------------


- (void)onJumpClicked:(id)sender
{
    [seeker1 runAction:[CCActionJumpTo actionWithDuration:0.5 position:seeker1.position height:40 jumps:1]];
}

// -----------------------------------------------------------------------
@end