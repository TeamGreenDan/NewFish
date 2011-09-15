//
//  untitled.h
//  Fish
//
//  Created by Billy-Jo Hunia on 3/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreventerLining : UIImageView {
	
	float XPos;
	float YPos;
	int Health;
	bool isLock;
	
}

@property float XPos;
@property float YPos;
@property int Health;
@property bool isLock;

-(id)init;
-(void)hit;
-(void)setXAndYPoints;
-(void)isDamage;
-(void)isDestroy;
-(void)isRepair;


@end