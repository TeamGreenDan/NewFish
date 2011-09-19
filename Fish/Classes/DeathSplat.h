//
//  DustMite.h
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"

@interface DeathSplat: Sprite
{
	int countdownToDisappear;
}

@property int countdownToDisappear;

-(id) init:(int)randomX :(int)randomY;
-(void) update;

@end
