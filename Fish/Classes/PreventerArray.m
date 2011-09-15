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
#import "DustMite.h"


@implementation PreventerArray
//PreventerSection tempSection;


-(void)createArray: (float) xStart: (float) yStart{		
	rows = [[NSMutableArray alloc] init];
	PreventerSection *tempSection;
	
	float currentX = xStart;
	float currentY = yStart;
	
	//[self createArrayLoop: currentX: currentY: true];
	
	for(int index = 0; index < 24; index++){
		tempSection = [[PreventerSection alloc] init];
		[tempSection createSection: currentX: currentY: true];
		[rows addObject: tempSection];
		
		currentY = currentY + 40;
		
		[tempSection release];
		
	}
	
	currentX = 743;
	currentY = yStart;
	
	//[self createArrayLoop: currentX: currentY: false];
	
	for(int index = 0; index < 24; index++){
		tempSection = [[PreventerSection alloc] init];
		[tempSection createSection: currentX: currentY: false];
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


-(void)checkCollisionWithTrigger: (DustMite *) mite{
	
	for(PreventerSection *currentSection in rows) {
		[currentSection checkCollisionWithTrigger:mite];
	}
}

-(void)repairRow{
	
	for(PreventerSection *currentSection in rows) {
		[currentSection repairSection];
	}
	
}

-(void) createArrayLoops: (float)xPoint: (float)yPoint: (bool)isOnLeftSide{
	
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
