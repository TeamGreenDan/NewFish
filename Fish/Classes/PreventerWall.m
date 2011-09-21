//
//  PreventerWall.m
//  Fish
//
//  Created by Daniel Loomb on 20/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PreventerWall.h"
#import "PreventerBubble.h"


@implementation PreventerWall

int pBubble_diameter = 25;


-(id)init : (UIView *) theController{
		
	self = [[NSMutableArray alloc]init];
	//Create the Preveter Wall
	int loopCount = (int)(((1004/pBubble_diameter)+ 1)*2);  //the height of the screen divided by the diameter of a bubble, 
																	//then added 1 for good measure, then times by two for both sides of scree
	
	for (int i = 0; i < loopCount; i++) {
		
		NSMutableArray *tempArray = [[NSMutableArray alloc]init];
		
		for (int j = 0; j < 2; j++) {
			int bubbleX;
			int bubbleY;
			if (i < (loopCount /2)) {//first wall
				float wallCurveOffset;
				
				if (i < (loopCount / 4)) {
					wallCurveOffset = ((20 - i) * 5);
					
					bubbleX = wallCurveOffset +  (pBubble_diameter * j);//X position to give the bubble
					bubbleY = (pBubble_diameter * i);//Y position to give the bubble
					
				}
				else {
					wallCurveOffset = (5 * (i - 20));
					
					bubbleX =  wallCurveOffset + (pBubble_diameter * j);//X position to give the bubble
					bubbleY = (pBubble_diameter * i);//Y position to give the bubble
					
				}				
			}
			else {//opposite wall
				float wallCurveOffset;
				
				if (i < (loopCount - (loopCount /4))) {					
					wallCurveOffset = ((61 - i) * 5);
					
					bubbleX =  (768 - (pBubble_diameter *(j +1))) - wallCurveOffset;//X position to give the bubble
					bubbleY = ((i - (loopCount /2)) * pBubble_diameter);//Y position to give the bubble
					
				}
				else {
					
					wallCurveOffset = (5 * (i - 61));
					
					bubbleX = (768 - (pBubble_diameter *(j +1))) - wallCurveOffset;//X position to give the bubble
					bubbleY = ((i - (loopCount /2)) * pBubble_diameter);//Y position to give the bubble
					
				}	
				
			}
					
					

			PreventerBubble *aBubble = [[PreventerBubble alloc] init :bubbleX : bubbleY];
			[theController addSubview:aBubble];
			[theController sendSubviewToBack:aBubble];
			[tempArray insertObject:aBubble atIndex:j];
			//sleep(2);
		}
		[self insertObject:tempArray atIndex:i];		
	}
	
	return self;
}

@end
