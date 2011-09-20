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


-(id) init:(int)randomX :(int)randomY : (Fish *) passedFish : (NSMutableArray *) passedPreventerArray : (int) myIndex : (NSMutableArray *) passedTriggerArray{
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
		boundsBottom = 854;
		boundsTopAndLeft = 150;
		boundsRight = 618;
		
		mySpits = [[NSMutableArray alloc]init];
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
	[self checkCollisionWithFish];
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
				//printf("Trigger Array count = %i \n" , [aTriggerArray count]);
				//for(int i = [mySpits count]; i < 0; i--) {
				//	[mySpits objectAtIndex:i]
				//}
				
				[aTriggerArray removeObjectAtIndex:self.index];
				[self updateArray:self.index];
				
				
				//calculate the score and update the score label	
				//score = score + 10;		
				//NSString *theScore = [NSString stringWithFormat:@"Score: %i",score];			  
				//[scoreLabel setText:theScore];
				//[scoreLabel setFont:[UIFont fontWithName:@"Suplexmentary Comic NC" size:36]];
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