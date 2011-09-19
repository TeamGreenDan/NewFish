//
//  Sprite.h
//  Fish
//
//  Created by Benjamin Squires on 6/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Fish;

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
}

@property float XSpeed;
@property float YSpeed;

@property float XPos;
@property float YPos;
@property float boundsTopAndLeft;
@property float boundsRight;
@property float boundsBottom;
@property int randomNum;
@property float direction;
@property int health;



-(void) update: (Fish *)aFish;
-(void) hit;
-(void)	rebound;
-(void)	move: (Fish *)aFish;
-(void) chooseTarget;
-(void) chooseLining;
-(void) takeDamage;

@end