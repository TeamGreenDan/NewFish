//
//  PreventerArray.h
//  Fish
//
//  Created by Billy-Jo Hunia on 3/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PreventerLining.h"

@class DustMite;


@interface PreventerArray : NSObject {
	NSMutableArray *rows;
}

-(id)initWithViewController:(UIViewController *) ViewUI;
-(void)createArray:(float)xStart :(float)yStart;
-(void)checkCollisionWithTrigger: (DustMite *) mite;
//-(void)checkHealthOfLinings;
-(void) createArrayLoop: (float)xPoint: (float)yPoint: (bool)isOnLeftSide;
-(NSMutableArray *)getRow;

@end
