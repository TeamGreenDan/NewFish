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

/*
 *	Sythesize This Sprites Properites
 */
@synthesize XPos;
@synthesize YPos;
@synthesize targetX;
@synthesize targetY;
@synthesize speed;
@synthesize direction;
@synthesize health;
@synthesize theLining;
@synthesize aFish;
@synthesize aTriggerArray;
@synthesize index;
@synthesize isAttacking;
@synthesize arrayBubbleWasIn;


/*
 *	Variables Shared by all Sprites
 */
float screen_width = 768;
float screen_height = 1002;
int theScore = 0;


/*
 *	The Method Called By the Global gameTimer(NSTimer in GameViewController)
 */
-(void) updateMe{
	[self move];	
	[self checkCollisionWithFish];
	
}





/*
 *	Method to Check whether This Sprite has reached its Target
 */
- (void) checkTargetReached {
	
	
	//if the trigger has almost reached its target choose a new one
	if (XPos > (targetX - 5) && XPos < (targetX + 5) && YPos > (targetY - 5) && YPos < (targetY + 5)) {

		if (isAttacking == TRUE) {//If this sprite is attacking do...
			
			//Sprite has Finished Attacking
			isAttacking = FALSE;
			
			//A temp PreventerBubble variable to hold the information of this Sprites Target Bubble
			PreventerBubble *tempBubble = [arrayBubbleWasIn lastObject];
			
			//Reduce Bubble Health
			[tempBubble takeDamage];
			
			if (tempBubble.Health == 0) {//If the bubble's health is 0 its time to destroy it so do...
				
				if ([arrayBubbleWasIn count] != 0) {//if the bubble was NOT the last one in the array do...
					
					//remove bubble from screen
					[tempBubble removeSelf];	
					
					//remove bubble from its array
					[arrayBubbleWasIn removeLastObject];
	
					//release bubble's space in memory
					[tempBubble release];
					
					
					if ([arrayBubbleWasIn count] == 0) {//if this bubble was the last in its array we have a breach so do...
						
						//---------------------TEMP LOSE CONDITION-----------------------------(just make a dialog appear saying player has lost)
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
			
			//set these variables to null to stop illegal updates
			tempBubble = NULL;
			arrayBubbleWasIn = NULL;
			
			
			//Make the sprite go back to somewhere in the middle of the 
			//screen so we don't have it travelling inside the preventer lining
			targetX = screen_width/2;
			targetY = arc4random() % 500 + 150;
			
		}
		else {//this sprite was not attacking so do...
			
			//the chance that this sprite will decide to attack
			int chanceOfAttack = arc4random() % 40;
			
			if (chanceOfAttack > 20) {//if the chance of attack was greater then half dont attack but do...
				self.chooseTarget;
				
			}
			else {//chance of attack was good so ATTACK!...

				self.chooseLining;
			}
			
		}
	}
	
}


/*
 *	A Method called by the subclass Pollen to move it away from the Fish
 */
- (void) calculateFishAvoidance: (float) distance dyFish: (float) dyFish restingDistance: (float) restingDistance k: (float) k dxFish: (float) dxFish  {
	
	//the amount of avoidance starts at zero
	float ddx = 0;
	float ddy = 0;
	
	if(distance < restingDistance)//if the distance between the Fish and the Pollen is less then the Avoidance Spring dictates its time to avoid the fish do...
	{
		//change the amount of avoidance dependent on the relation with the Fish
		ddx = k*(distance-restingDistance)*(dxFish/distance);
		ddy = k*(distance-restingDistance)*(dyFish/distance);
	}		
	
	//adds teh avoidance to the current position
	XPos += ddx;
	YPos += ddy;
	
}


/*
 *	The Method that makes the Sprite move around the Screen
 */
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
	
	
	if ([self isKindOfClass:[Pollen class]]) {// If this Sprite is of Type Pollen do this...
		float dxFish =  aFish.XPos - XPos;
		float dyFish =  aFish.YPos - YPos;	
		float distance = sqrtf(dxFish*dxFish + dyFish*dyFish);
		[self calculateFishAvoidance: distance dyFish: dyFish restingDistance: restingDistance k: k dxFish: dxFish];
	}
	
	//Check if Sprite has reached its target
	[self checkTargetReached];	
	
	
	//draws the result to the screen
	[self setCenter:CGPointMake(XPos, YPos)];
}


/*
 *	The Method to choose a random posistion on the screen
 */
-(void) chooseTarget{
	
	targetX = arc4random() % 468 + 150;
	targetY = arc4random() % 704 + 150;
}

/*
 *	The Method to choose a Random bubble in the preventer Wall
 */
-(void) chooseLining{
	
	//---------------------------------This is the random index in the preventer array to use,  !WARNING!-- This currently uses a hard coded varible. if the bubble size changes so must this
	int randomIndex = arc4random() % 80;
	
	//Save this position so it can be accessed later on
	arrayBubbleWasIn = [theLining objectAtIndex:randomIndex];
	
	//A temp bubble object to perform operations on
	PreventerBubble *tempBubble = [arrayBubbleWasIn lastObject];
	
	
	if (tempBubble.XPos < (screen_width/2)) {//if the bubble is on the left wall do...
		
		//set Target
		targetX = tempBubble.XPos + 45;
	}
	else {//bubble is on the right wall do...
		
		//set target
		targetX = tempBubble.XPos;
		
	}

	//set target y. this is the same no matter which side of the wall.	
	targetY = tempBubble.YPos;
	
	//Let Later operations know we are attacking.
	isAttacking = TRUE;
	
}


/*
 *	A Method to reduce the Sprites health
 */
-(void) takeDamage{
	health--;
}


/*
 *	A Method to check Whether this sprite has hit the fish
 */
-(void) checkCollisionWithFish{
	
	if(YPos > (aFish.YPos-43) && YPos < (aFish.YPos +43)){ // if Sprite is within bounds of Fish's Y boundBox
		if(XPos > (aFish.XPos-51) && XPos < (aFish.XPos +51))//if Sprite is within bounds of Fish's X boundBox
		{
			//make the Fish react
			[aFish hit];
			
			//Reduce Sprite Health
			[self takeDamage];
			
			
			if (self.health == 0) {//If health has reached Zero its time to die so do...
				
				theScore += 10;//update Score
				
				//Draw a Splat Image on screen to represent This Sprites Destruction
				DeathSplat *aSplat = [[DeathSplat alloc] init: self.XPos : self.YPos ];
				[self.superview addSubview:aSplat];
				[self.superview sendSubviewToBack:aSplat];
				
				//remove this Sprite from the screen
				[self removeFromSuperview];
				
				//Remove this sprite from the global update Array. Syncronized to stop concurrent operation errors
				@synchronized(self){
					[aTriggerArray removeObjectAtIndex:self.index];//remove self
					
					//Update every other Sprite in the array so its index is still correct
					[self updateArray:self.index];				
				}
				

			}
			else {// Did not die, do...
				
				//chose new target to atempt to get away from fish
				[self chooseTarget];
			}

			
			//----------------------------Temp Win Condition
			if ([aTriggerArray count]  < 1) {
				UIAlertView *alertWithOkButto = alertWithOkButto = [[UIAlertView alloc] initWithTitle:@"WIN"
																							  message:@"YOU HAVE WON! \n YOU'RE THE KING" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				
				[alertWithOkButto show];
				[alertWithOkButto release];
			}
		}
		
	}
	
	
}


/*
 * A method to update Indexes in the Global update Array
 *
 * (int) startingPoint = position of the last removed Sprite 
 *
 */
-(void) updateArray : (int) startingPoint{
	
	for (int i = startingPoint + 1; i < ([aTriggerArray count]); i++) {// for each object in the way after the starting point do..
		
		Sprite *aSprite = [aTriggerArray objectAtIndex:i];
		
			//reduce sprites index by one
			aSprite.index -= 1;
		
	}
}

/*
 *	A Method to access the score Globally
 */
-(int) theScore{
	return theScore;
}

@end
