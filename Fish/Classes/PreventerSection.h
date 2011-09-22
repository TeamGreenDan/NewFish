//
//  PreventerSection.h
//  Fish
//
//  Created by Billy-Jo Hunia on 6/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"

@interface PreventerSection : NSObject {
	 NSMutableArray *sections;
}

-(id)initWithViewController:(UIViewController *) ViewUI;
-(void)createSection:(float)xStart :(float)yStart :(bool)isOnLeftSide;
<<<<<<< HEAD
-(void)checkCollisionWithTrigger: (Sprite *) aSprite;
//-(void)createMucus:(UIViewController*)viewController;
=======
-(void)checkCollisionWithTrigger: (DustMite *) mite;
//-(void)createMucus;
>>>>>>> da7a249915a92b5924307f6617f108b4267a37ac
-(void)repairSection;
-(NSMutableArray *)getSection;

@end
