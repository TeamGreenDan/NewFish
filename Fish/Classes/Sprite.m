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
#import <stdlib.h>
#import <math.h>



@implementation Sprite
@synthesize XSpeed;
@synthesize YSpeed;

@synthesize XPos;
@synthesize YPos;
@synthesize randomNum;
@synthesize direction;
@synthesize boundsTopAndLeft;
@synthesize boundsRight;
@synthesize boundsBottom;
@synthesize health;

//@synthesize timer;

float screen_width = 768;
float screen_height = 1002;



-(void) update: (Fish *)aFish{
	[self move:aFish];

}

-(void)hit{
	self.hidden = TRUE;
}


-(void)rebound{
	direction = -direction;
	
	XPos = self.center.x + direction;
	YPos = self.center.y + direction;
	 
}




- (void) checkTargetReached {
	//if the trigger has almost reached its target choose a new one
	if ((int)XPos > (10 - targetX) && (int)XPos < (10 + targetX) && (int)YPos > (10 - targetY) && (int)YPos < (10 + targetY)) {
		if(targetX > 618 || targetX < 150){
			targetX = arc4random() % 368 + 250;
			targetY = arc4random() % 604 + 250;			
		}
		else {			
			int chance = arc4random() % 40;
			if (chance > 1) {
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
-(void) move: (Fish *) aFish{
	
	float k = .05;					//strength of the avoidance spring
    float restingDistance = 300;	//distance the spring starts to take effect
	float speed = 3;				//the speed to travel.
    
	
	
	[self checkTargetReached];	
	

	//Works out the direction to head to get to the target
	float dxTarget = XPos - targetX;
	float dyTarget = YPos - targetY;	
	direction = atan2(dyTarget, dxTarget);
	
	//works out the speed to apply for the given direction
	XPos -= speed * cos(direction);
	YPos -= speed * sin(direction);
	
	
	//works out the distance between the Fish and the trigger
	float dxFish =  aFish.XPos - XPos;
	float dyFish =  aFish.YPos - YPos;	
	float distance = sqrtf(dxFish*dxFish + dyFish*dyFish);

	if ([self isKindOfClass:[Pollen class]]) {		
		[self calculateFishAvoidance: distance dyFish: dyFish restingDistance: restingDistance k: k dxFish: dxFish];
	}
	
	[self checkBounds];

	
	
	//draws the result to the screen
	[self setCenter:CGPointMake(XPos, YPos)];
}

-(void) chooseTarget{
	boundsBottom = 854;
	boundsTopAndLeft = 150;
	boundsRight = 618;
	
	targetX = arc4random() % 468 + 150;
	targetY = arc4random() % 704 + 150;
}


-(void) chooseLining{
	
	boundsBottom = 1000;
	boundsTopAndLeft = 0;
	boundsRight = 768;
	
	int chance = arc4random() % 20;
	
	if(chance >= 10){
		targetX = arc4random() % 150 + 618;
	}
	else {
		targetX = arc4random() % 150;
	}
	targetY = arc4random() % 1000;

}

-(void) takeDamage{
	health--;
	[self chooseTarget];
}



@end
