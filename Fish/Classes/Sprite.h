//
//  Sprite.h
//  Fish
//
//  Created by Benjamin Squires on 6/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fish.h"


@interface Sprite : UIImageView {
	float XSpeed;
	float YSpeed;
	int XPos;
	int YPos;
	int randomNum;
	int targetX;
	int targetY;
	float direction;
	float boundsTopAndLeft;
	float boundsRight;
	float boundsBottom;
	int health;
	float speed;
	int index;
	
	bool isAttacking;
	
	Fish *aFish;
	NSMutableArray *aTriggerArray;
	NSMutableArray *theLining;
	NSMutableArray *arrayBubbleWasIn;
}

@property float XSpeed;
@property float YSpeed;

@property int XPos;
@property int YPos;
@property int targetX;
@property int targetY;
@property float speed;
@property float boundsTopAndLeft;
@property float boundsRight;
@property float boundsBottom;
@property int randomNum;
@property float direction;
@property int health;
@property int index;
@property bool isAttacking;


@property (nonatomic, retain)Fish *aFish;
@property (nonatomic, retain)NSMutableArray *aTriggerArray;
@property (nonatomic, retain)NSMutableArray *theLining;
@property (nonatomic, retain)NSMutableArray *arrayBubbleWasIn;


-(void) updateMe;
-(void)	move;
-(void) chooseTarget;
-(void) chooseLining;
-(void) takeDamage;
-(void) checkCollisionWithFish;
-(void) updateArray : (int) startingPoint;
-(int) theScore;

@end