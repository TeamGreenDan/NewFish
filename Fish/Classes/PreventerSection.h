//
//  PreventerSection.h
//  Fish
//
//  Created by Billy-Jo Hunia on 6/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DustMite.h"

@interface PreventerSection : NSObject {
	 NSMutableArray *sections;
}

-(void)createSection:(float)xStart :(float)yStart :(bool)isOnLeftSide;
-(void)checkCollisionWithTrigger: (DustMite *) mite;
-(void)createMucus:(UIViewController*)viewController;
-(void)repairSection;
-(NSMutableArray *)getSection;

@end
