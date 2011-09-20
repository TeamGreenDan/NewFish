//
//  PreventerBubble.h
//  Fish
//
//  Created by Daniel Loomb on 20/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PreventerBubble : UIImageView {
	int XPos;
	int YPos;
	int Health;
}

@property int XPos;
@property int YPos;
@property int Health;

-(id)init : (int)givenXpos : (int)givenYpos;
-(void) removeSelf;
-(void) takeDamage;

@end
