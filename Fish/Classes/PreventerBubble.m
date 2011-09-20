//
//  PreventerBubble.m
//  Fish
//
//  Created by Daniel Loomb on 20/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PreventerBubble.h"


@implementation PreventerBubble

@synthesize XPos;
@synthesize YPos;
@synthesize Health;

-(id)init : (int)givenXpos : (int)givenYpos;{
    
    self = [super initWithImage:[UIImage imageNamed:@"preventerBubbleGreen.png"]];

    if (self) {
		Health = 2;
        XPos = givenXpos;
		YPos = givenYpos;
		[self setFrame:CGRectMake(XPos, YPos, 25, 25)];
	}
    return self;
}

-(void)removeSelf{
	printf("Removing Self - My X was = %i, My Y was = %i, So long.\n", XPos, YPos);
	[self removeFromSuperview];
}

-(void)takeDamage{
	printf("Taking Damage - My X was = %i, My Y was = %i, Ouch.\n", XPos, YPos);
	Health --;
	self.image = [UIImage imageNamed:@"preventerBubbleRed.png"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
