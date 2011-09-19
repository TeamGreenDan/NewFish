//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnimalFur.h"
#import "SpitProjectile.h"

@implementation AnimalFur

@synthesize mySpits;


float animalFur_radius = 30;


- (id)init :(int)randomX : (int)randomY : (Fish *) passedFish{
    self = [super initWithImage:[UIImage imageNamed:@"animalFur_base.png"]];
    if(self){
		self.chooseTarget;
		health = 3;
		speed = 3;
		XPos = randomX;
		YPos = randomY;
		aFish = passedFish;
        [self setFrame:CGRectMake(XPos, YPos, 52, 63)];		
		boundsBottom = 854;
		boundsTopAndLeft = 150;
		boundsRight = 618;
		
		mySpits = [[NSMutableArray alloc]initWithCapacity:10];
    }
    return self;
}

-(void) updateMe{
	[self move];
	int i = ([mySpits count]-1);
	for (i; i >= 0; i--) {
		SpitProjectile *updateSpit = [mySpits objectAtIndex:i];
		[updateSpit moveSpit : mySpits];
		//printf("happend\n");
	}
}



/* ####Overides Superclass Method
 * 
 */
-(void)chooseTarget{
	int chance = arc4random() % 20;
	if (chance < 3) {
		[self spitProjectile];
	}

	
	targetX = arc4random() % 530 + 150;
	targetY = arc4random() % 804 + 150;
}

-(void)spitProjectile{
	SpitProjectile *theSpit = [[SpitProjectile alloc] init: XPos : YPos : aFish];
	[mySpits addObject: theSpit];
	
	
	[self.superview addSubview:theSpit];
	
}

@end