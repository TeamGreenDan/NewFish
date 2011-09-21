//
//  Sprite.m
//  Fish
//
//  Created by Benjamin Squires on 6/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"
#import "Fish.h"
#import "Pollen.h"
#import "DustMite.h"
#import "AnimalFur.h"
#import "DeathSplat.h"
#import <stdlib.h>
#import <math.h>
#import "PreventerBubble.h"



@implementation Sprite
@synthesize XSpeed;
@synthesize YSpeed;

@synthesize XPos;
@synthesize YPos;
@synthesize targetX;
@synthesize targetY;
@synthesize speed;
@synthesize randomNum;
@synthesize direction;
@synthesize boundsTopAndLeft;
@synthesize boundsRight;
@synthesize boundsBottom;
@synthesize health;
@synthesize theLining;
@synthesize aFish;
@synthesize aTriggerArray;
@synthesize index;
@synthesize isAttacking;
@synthesize arrayBubbleWasIn;

float screen_width = 768;
float screen_height = 1002;
int theScore = 0;



-(void) updateMe{
	[self move];	
	[self checkCollisionWithFish];
	
}






- (void) checkTargetReached {
	//if the trigger has almost reached its target choose a new one
	if (XPos > (targetX - 5) && XPos < (targetX + 5) && YPos > (targetY - 5) && YPos < (targetY + 5)) {

		if (isAttacking == TRUE) {
			isAttacking = FALSE;
			
			PreventerBubble *tempBubble = [arrayBubbleWasIn lastObject];
			[tempBubble takeDamage];
			
			if (tempBubble.Health == 0) {
				
				if ([arrayBubbleWasIn count] != 0) {
					
					[tempBubble removeSelf];
					[arrayBubbleWasIn removeLastObject];
					[tempBubble release];
					
					if ([arrayBubbleWasIn count] == 0) {
						UIAlertView *alertWithOkButto = alertWithOkButto = [[UIAlertView alloc] initWithTitle:@"LOSE"
																									  message:@"Asthma Triggers have breached the Preventer Lining! \nYOU HAVE LOST!"
																									 delegate:self 
																							cancelButtonTitle:@"OK" 
																							otherButtonTitles:nil];
						
						[alertWithOkButto show];
						[alertWithOkButto release];
					}
				}	
				

			}
			tempBubble = NULL;
			arrayBubbleWasIn = NULL;
			targetX = screen_width/2;
			targetY = arc4random() % 500 + 150;
		}
		else {
			
			int chanceOfAttack = arc4random() % 40;
//			printf("Chance of Attack = %i\n", chanceOfAttack);
			if (chanceOfAttack > 20) {
				self.chooseTarget;
				
			}
			else {

				self.chooseLining;
			}
			
		}
	}
	
}




- (void) checkBounds {
	if (XPos < boundsTopAndLeft) {
		XPos = boundsTopAndLeft;
	}
	if(XPos > boundsRight){
		XPos = boundsRight;
	}
	if (YPos < boundsTopAndLeft) {
		YPos = boundsTopAndLeft;
	}
	if (YPos > boundsBottom) {
		YPos = boundsBottom;
	}
	
}
- (void) calculateFishAvoidance: (float) distance dyFish: (float) dyFish restingDistance: (float) restingDistance k: (float) k dxFish: (float) dxFish  {
	//adds avoidance to the trigger if it is close to the fish.
	float ddx = 0;
	float ddy = 0;
	if(distance < restingDistance)
	{
		ddx = k*(distance-restingDistance)*(dxFish/distance);
		ddy = k*(distance-restingDistance)*(dyFish/distance);
	}		
	//adds teh avoidance to the current position
	XPos += ddx;
	YPos += ddy;
	
}
-(void) move{
	
	float k = .05;					//strength of the avoidance spring
	float restingDistance = 300;	//distance the spring starts to take effect
	
	//Works out the direction to head to get to the target
	float dxTarget = XPos - targetX;
	float dyTarget = YPos - targetY;	
	direction = atan2(dyTarget, dxTarget);
	
	//works out the speed to apply for the given direction
	XPos -= speed * cos(direction);
	YPos -= speed * sin(direction);
	
	
	//works out the distance between the Fish and the trigger
	
	
	if ([self isKindOfClass:[Pollen class]]) {	
		float dxFish =  aFish.XPos - XPos;
		float dyFish =  aFish.YPos - YPos;	
		float distance = sqrtf(dxFish*dxFish + dyFish*dyFish);
		[self calculateFishAvoidance: distance dyFish: dyFish restingDistance: restingDistance k: k dxFish: dxFish];
	}
	
//	[self checkBounds];
	[self checkTargetReached];	
	
	
	//draws the result to the screen
	[self setCenter:CGPointMake(XPos, YPos)];
}

-(void) chooseTarget{
//	printf("Choosing Targert\n");
	boundsBottom = 854;
	boundsTopAndLeft = 150;
	boundsRight = 618;
	
	targetX = arc4random() % 468 + 150;
	targetY = arc4random() % 704 + 150;
}


-(void) chooseLining{
//	printf("Choosing Lining\n");
	boundsBottom = 1000;
	boundsTopAndLeft = 0;
	boundsRight = 768;
	
	int randomIndex = arc4random() % 80;
	
	arrayBubbleWasIn = [theLining objectAtIndex:randomIndex];
	PreventerBubble *tempBubble = [arrayBubbleWasIn lastObject];
	
	
	if (tempBubble.XPos < (screen_width/2)) {
		targetX = tempBubble.XPos + 45;
	}
	else {
		targetX = tempBubble.XPos;
	}

	
	
	targetY = tempBubble.YPos;
//	printf("ATTACK!\n");
	
	isAttacking = TRUE;
	
}

-(void) takeDamage{
	health--;
}

-(void) checkCollisionWithFish{
	if(YPos > (aFish.YPos-43) && YPos < (aFish.YPos +43)){
		if(XPos > (aFish.XPos-51) && XPos < (aFish.XPos +51))
		{
//			printf("Hit Fish - Reacting \n");
			[aFish hit];
			[self takeDamage];
			
			if (self.health == 0) {
				//printf("Score = %i", score);
				theScore += 10;
				
				
				DeathSplat *aSplat = [[DeathSplat alloc] init: self.XPos : self.YPos ];
				[self.superview addSubview:aSplat];
				[self.superview sendSubviewToBack:aSplat];
				[self removeFromSuperview];
				//printf("Trigger Array count = %i \n" , [aTriggerArray count]);
				
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

-(void) updateArray : (int) startingPoint{
	//printf("Updating Array, Starting point = %i, Array Count = %i\n", startingPoint, [aTriggerArray count]);
	for (int i = startingPoint + 1; i < ([aTriggerArray count]); i++) {
		//printf("Time Around %i, \n" ,i);
		Sprite *aSprite = [aTriggerArray objectAtIndex:i];
		
			aSprite.index -= 1;
		
	}
}

-(int) theScore{
	return theScore;
}

@end
