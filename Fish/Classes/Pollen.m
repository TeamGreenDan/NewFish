//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Pollen.h"

@implementation Pollen




float pollen_radius = 30;


-(id) init:(int)randomX :(int)randomY : (Fish *) passedFish : (NSMutableArray *) passedPreventerArray : (int) myIndex : (NSMutableArray *) passedTriggerArray : (int) passedScore{
    self = [super initWithImage:[UIImage imageNamed:@"pollen_base.png"]];
    if(self){
		health = 1;
		XPos = randomX;
		YPos = randomY;
		speed = 5;
		aFish = passedFish;
		index = myIndex;
		isAttacking = FALSE;
		theLining = passedPreventerArray;
		aTriggerArray = passedTriggerArray;
		
        [self setFrame:CGRectMake(XPos, YPos, 51, 55)];
		
		
		self.chooseTarget;
		
		
    }
    return self;
}

@end