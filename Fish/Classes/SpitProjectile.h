//
//  SpitProjectile.h
//  Fish
//
//  Created by Daniel Loomb on 8/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"


@interface SpitProjectile : Sprite {
	NSMutableArray *arraySpitIsIn;

}

@property (nonatomic, retain)NSMutableArray *arraySpitIsIn;

- (id)init :(int)randomX : (int)randomY : (Fish *) passedFish : (NSMutableArray *) passedArray;
-(void) moveSpit;
-(void) removeSelf;

@end
