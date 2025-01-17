//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnimalFur.h"
#import "SpitProjectile.h"
#import "DeathSplat.h"

@implementation AnimalFur

@synthesize mySpits;


float animalFur_radius = 30;


-(id) init:(int)randomX :(int)randomY : (Fish *) passedFish : (NSMutableArray *) passedPreventerArray : (int) myIndex : (NSMutableArray *) passedTriggerArray : (int) passedScore{
    self = [super initWithImage:[UIImage imageNamed:@"animalFur_base.png"]];
    if(self){
		self.chooseTarget;
		health = 3;
		speed = 3;
		XPos = randomX;
		YPos = randomY;
		aFish = passedFish;
		index = myIndex;
		theLining = passedPreventerArray;
		aTriggerArray = passedTriggerArray;
		isAttacking = FALSE;
        [self setFrame:CGRectMake(XPos, YPos, 52, 63)];	
		
		mySpits = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void) updateMe{
	[self move];
	int i = ([mySpits count]-1);
	for (i; i >= 0; i--) {
		SpitProjectile *updateSpit = [mySpits objectAtIndex:i];
		[updateSpit moveSpit];
		//printf("happend\n");
	}
	[self checkCollisionWithFish];
}



/* ####Overides Superclass Method
 * 
 */
-(void)chooseTarget{
	int chance = arc4random() % 20;
	if (chance < 10) {
		[self spitProjectile];
	}

	
	targetX = arc4random() % 530 + 150;
	targetY = arc4random() % 804 + 150;
}

-(void)spitProjectile{
	SpitProjectile *theSpit = [[SpitProjectile alloc] init: XPos : YPos : aFish : mySpits];
	[mySpits addObject: theSpit];
	
	[self.superview addSubview:theSpit];
	
}

-(void) checkCollisionWithFish{
	if(YPos > (aFish.YPos-40) && YPos < (aFish.YPos +40)){
		if(XPos > (aFish.XPos-40) && XPos < (aFish.XPos +40))
		{
			[aFish hit];
			[self takeDamage];
			if (self.health == 0) {
				

				
				DeathSplat *aSplat = [[DeathSplat alloc] init: self.XPos : self.YPos ];
				[self.superview addSubview:aSplat];
				[self.superview sendSubviewToBack:aSplat];
				[self removeFromSuperview];
				
				for(int i = [mySpits count]-1; i >= 0; i--) {
					
					SpitProjectile *tempSpit = [mySpits objectAtIndex:i];
					[tempSpit removeSelf];
				}
				
				@synchronized(self){
					[aTriggerArray removeObjectAtIndex:self.index];
					[self updateArray:self.index];
				}
				
			}
			else {
				[self chooseTarget];
			}

			
			//Temp Win Condition
			//printf("HIT! numMites = %d\n", [aTriggerArray count]);
			if ([aTriggerArray count]  < 1) {
				UIAlertView *alertWithOkButto = alertWithOkButto = [[UIAlertView alloc] initWithTitle:@"WIN"
																							  message:@"YOU HAVE WON! \n YOU'RE THE KING" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				
				[alertWithOkButto show];
				[alertWithOkButto release];
			}
		}
		
	}
	
	
}


@end