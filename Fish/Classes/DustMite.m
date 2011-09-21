//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DustMite.h"

@implementation DustMite



float sprite_radius = 25;


- (id)init :(int)randomX : (int)randomY : (Fish *) passedFish : (NSMutableArray *) passedPreventerArray : (int) myIndex : (NSMutableArray *) passedTriggerArray : (int) passedScore{
    self = [super initWithImage:[UIImage imageNamed:@"dustMite_base.png"]];
    if(self){
		health = 2;
		XPos = randomX;
		YPos = randomY;
		speed = 3;
		aFish = passedFish;
		index = myIndex;
		theLining = passedPreventerArray;
		aTriggerArray = passedTriggerArray;
		isAttacking = FALSE;
	
        [self setFrame:CGRectMake(XPos, YPos, 72, 42)];
		

		self.chooseTarget;
		
				
    }
    return self;
}

@end