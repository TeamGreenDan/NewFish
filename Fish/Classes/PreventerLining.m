//
//  untitled.m
//  Fish
//
//  Created by Billy-Jo Hunia on 3/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PreventerLining.h"


@implementation PreventerLining

@synthesize YPos;
@synthesize XPos;
@synthesize Health;
@synthesize isLock;

int timer;
float lining_radius = 25;

-(void)hit{
	Health = Health - 1;
	
	if(Health == 1)
		[self isDamage];
	
	if(Health == 0)
		[self isDestroy];
}

- (id)init {
    self = [super initWithImage:[UIImage imageNamed:@"preventerBubbleGreen.png"]];
	
	if(self){
		
	[self setFrame:CGRectMake(0, 0, lining_radius*2, lining_radius*2)];
	
	self.Health = 2;
	}
	
    return self;
}

-(void)setXAndYPos{
	XPos = self.center.x;
	YPos = self.center.y;
}

-(void)isDamage{
	[self setImage:[UIImage imageNamed:@"preventerBubbleRed.png"]];
}

-(void)isDestroy{
	self.hidden = true;
	
}

-(void)isRepair{
	self.hidden = false;
}


@end
