//
//  DustMite.m
//  Fish
//
//  Created by Daniel Loomb on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DustMite.h"

@implementation DustMite


float sprite_radius = 25;


- (id)init :(int)randomX : (int)randomY {
    self = [super initWithImage:[UIImage imageNamed:@"dustMite_base.png"]];
    if(self){
		
		XPos = randomX;
		YPos = randomY;
        [self setFrame:CGRectMake(XPos, YPos, 72, 42)];
		

		self.chooseTarget;
		
				
    }
    return self;
}

@end