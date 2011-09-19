//
//  Sprite.h
//  Fish
//
//  Created by Benjamin Squires on 6/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PreventerArray.h"
#import "Fish.h"


@interface Sprite : UIImageView {
	float XSpeed;
	float YSpeed;
	float XPos;
	float YPos;
	int randomNum;
	int targetX;
	int targetY;
	float direction;
	float boundsTopAndLeft;
	float boundsRight;
	float boundsBottom;
	int health;
	float speed;
	
	Fish *aFish;
}

@property float XSpeed;
@property float YSpeed;

@property float XPos;
@property float YPos;
@property float speed;
@property float boundsTopAndLeft;
@property float boundsRight;
@property float boundsBottom;
@property int randomNum;
@property float direction;
@property int health;
@property (nonatomic, retain)Fish *aFish;
@property (nonatomic, retain) PreventerArray *theLining;



-(void) updateMe;
-(void) hit;
-(void)	rebound;
-(void)	move;
-(void) chooseTarget;
-(void) chooseLining;
-(void) takeDamage;

@end