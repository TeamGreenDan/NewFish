//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DeathSplat.h"

@implementation DeathSplat

@synthesize countdownToDisappear;



- (id)init :(int)randomX : (int)randomY {
    self = [super initWithImage:[UIImage imageNamed:@"deathSplat_base.png"]];
    if(self){
		
		XPos = randomX;
		YPos = randomY;
        [self setFrame:CGRectMake(XPos- 25, YPos - 25, 50, 50)];
		[NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(update) userInfo:nil repeats:true];
		
		countdownToDisappear = 20;
		
    }
    return self;
}

-(void) update{
	if (countdownToDisappear < 0) {
		[self removeFromSuperview];
	}
	else {
		countdownToDisappear--;
	}

	
}

@end