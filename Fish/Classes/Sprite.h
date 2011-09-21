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
	//Sprites Position on Screen	
	int XPos;
	int YPos;
	
	//Where Sprite Is going to go on screen
	int targetX;
	int targetY;
	
	//Other Properties
	int health;
	float direction;
	float speed;
	
	//Where this Sprite is in the Global Update Array
	int index;
	
	//Whether the current Sprite is attacking the lining
	bool isAttacking;
	
	//Pointers to Global Objects
	Fish *aFish;
	NSMutableArray *aTriggerArray;
	NSMutableArray *theLining;
	NSMutableArray *arrayBubbleWasIn;
}

/*
 *	Declaring Variables as Properties so they can be Accessed outside Of Sprite Class
 */
@property int XPos;
@property int YPos;

@property int targetX;
@property int targetY;

@property int health;
@property float direction;
@property float speed;
@property int index;
@property bool isAttacking;


@property (nonatomic, retain)Fish *aFish;
@property (nonatomic, retain)NSMutableArray *aTriggerArray;
@property (nonatomic, retain)NSMutableArray *theLining;
@property (nonatomic, retain)NSMutableArray *arrayBubbleWasIn;


/*
 * Methods For The Sprite Class
 */
-(void) updateMe;
-(void)	move;
-(void) chooseTarget;
-(void) chooseLining;
-(void) takeDamage;
-(void) checkCollisionWithFish;
-(void) updateArray : (int) startingPoint;
-(int) theScore;

@end