//
//  PreventerBubble.h
//  Fish
//
//  Created by Daniel Loomb on 20/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PreventerBubble : UIImageView {
	float XPos;
	float YPos;
	int Health;
}

@property float XPos;
@property float YPos;
@property int Health;

-(id)init : (float)givenXpos : (float)givenYpos;
-(void) removeSelf;
-(void) takeDamage;

@end
