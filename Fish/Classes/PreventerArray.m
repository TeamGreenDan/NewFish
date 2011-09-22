//
//  PreventerArray.m
//  Fish
//
//  Created by Billy-Jo Hunia on 3/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PreventerArray.h"
#import "PreventerSection.h"
#import "PreventerLining.h"
#import "Sprite.h"


@implementation PreventerArray
//PreventerSection tempSection;
UIViewController *arrayView;

-(id)initWithViewController:(UIViewController *) ViewUI{
	if(self){
		arrayView = ViewUI;}
	return self;
}

-(void)createArray: (float) xStart: (float) yStart{		
	rows = [[NSMutableArray alloc] init];
	PreventerSection *tempSection;
	
	float currentX = xStart;
	float currentY = yStart;
	
	//[self createArrayLoop: currentX: currentY: true];
	
	for(int index = 0; index < 24; index++){
<<<<<<< HEAD
		tempSection = [[PreventerSection alloc] init];
		[tempSection createSection: currentX: currentY: TRUE];
=======
		tempSection = [[PreventerSection alloc] initWithViewController: arrayView];
		[tempSection createSection: currentX: currentY: true];
>>>>>>> da7a249915a92b5924307f6617f108b4267a37ac
		[rows addObject: tempSection];
		
		currentY = currentY + 40;
		
		[tempSection release];
		
	}
	
	currentX = 743;
	currentY = yStart;
	
	//[self createArrayLoop: currentX: currentY: false];
	
	for(int index = 0; index < 24; index++){
<<<<<<< HEAD
		tempSection = [[PreventerSection alloc] init];
		[tempSection createSection: currentX: currentY: FALSE];
=======
		tempSection = [[PreventerSection alloc] initWithViewController: arrayView];
		[tempSection createSection: currentX: currentY: false];
>>>>>>> da7a249915a92b5924307f6617f108b4267a37ac
		[rows addObject: tempSection];
		
		currentY = currentY + 40;
		
		[tempSection release];
		
	}
}

-(NSMutableArray *)getRow{
	NSMutableArray *arrayLining;
	arrayLining = [[NSMutableArray alloc] init];
	
	for(PreventerSection *tempSection in rows) {
		
		for(PreventerLining *tempLining in [tempSection getSection]){
			[arrayLining addObject: tempLining];
		}
	}
	
	return arrayLining;
	[arrayLining release];
}


-(void)checkCollisionWithTrigger: (Sprite *) aSprite{
	
	for(PreventerSection *currentSection in rows) {
		[currentSection checkCollisionWithTrigger:aSprite];
	}
}

-(void)repairRow{
	
	for(PreventerSection *currentSection in rows) {
		[currentSection repairSection];
	}
	
}

-(void) createArrayLoop: (float)xPoint: (float)yPoint: (BOOL)isOnLeftSide{
	
	PreventerSection *tempSection;
	float tempX = xPoint;
	float tempY = yPoint;
	
	for(int i = 0; i < 10; i++){
		tempSection = [[PreventerSection alloc] init];
		[tempSection createSection: tempX: tempY: isOnLeftSide];
		[rows addObject: tempSection];
		[tempSection release];
		
		tempY = tempY + 40;
	}
}

@end
