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




- (id)init :(int)randomX : (int)randomY : (Fish *) passedFish{
    self = [super initWithImage:[UIImage imageNamed:@"spitBubble.png"]];
    if(self){
		
		XPos = randomX;
		YPos = randomY;		
		speed = 5;
		targetX = (int)passedFish.XPos;
		targetY = (int)passedFish.YPos;
		
        [self setFrame:CGRectMake(XPos, YPos, 25, 25)];
		
		//[NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(move) userInfo:nil repeats:true];

		
		
    }
    return self;
}

-(void) moveSpit : (NSMutableArray *) passedArray{
	
	if ((int)XPos > (5 - targetX) && (int)XPos < (5 + targetX) && (int)YPos > (5 - targetY) && (int)YPos < (5 + targetY)) {
		[self removeFromSuperview];
		[aFish hit];
		[passedArray removeObjectAtIndex:0];
		[self release];
		
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

@end
