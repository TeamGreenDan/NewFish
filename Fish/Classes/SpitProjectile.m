//
//  SpitProjectile.m
//  Fish
//
//  Created by Daniel Loomb on 8/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SpitProjectile.h"
#import <math.h>


@implementation SpitProjectile

@synthesize arraySpitIsIn;


- (id)init :(int)randomX : (int)randomY : (Fish *) passedFish : (NSMutableArray *) passedArray{
    self = [super initWithImage:[UIImage imageNamed:@"spitBubble.png"]];
    if(self){
		
		XPos = randomX;
		YPos = randomY;		
		speed = 5;
		targetX = (int)passedFish.XPos;
		targetY = (int)passedFish.YPos;
		arraySpitIsIn = passedArray;
		
        [self setFrame:CGRectMake(XPos, YPos, 25, 25)];
		
		//[NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(move) userInfo:nil repeats:true];

		
		
    }
    return self;
}

-(void) moveSpit{	
	if (XPos > (targetX -5) && XPos < (targetX +  5) && YPos > (targetY - 5) && YPos < (targetY + 5)) {
		
		[self removeSelf];
		[aFish hit];
				
		
	}
	
	//Works out the direction to head to get to the target
	float dxTarget = XPos - targetX;
	float dyTarget = YPos - targetY;	
	direction = atan2(dyTarget, dxTarget);
	
	//works out the speed to apply for the given direction	
	XPos -= speed * cos(direction);
	YPos -= speed * sin(direction);
	[self setCenter:CGPointMake(XPos, YPos)];
}

-(void) removeSelf{
	[self removeFromSuperview];
}

@end
