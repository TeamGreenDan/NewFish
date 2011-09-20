//
//  AnimalFur.h
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"

@interface AnimalFur : Sprite
{
	NSMutableArray *mySpits;
}

@property (nonatomic, retain) NSMutableArray *mySpits;

-(id) init:(int)randomX :(int)randomY : (Fish *) passedFish : (NSMutableArray *) passedPreventerArray : (int) myIndex : (NSMutableArray *) passedTriggerArray;

-(void) chooseTarget;
-(void)spitProjectile;


@end
