//
//  PreventerSection.m
//  Fish
//
//  Created by Billy-Jo Hunia on 6/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PreventerSection.h"
#import "PreventerLining.h"
#import <stdlib.h>
#import <UIKit/UIKit.h>


@implementation PreventerSection

float xPos;
float yPos;

int maxNumberOfLining = 3;
int healthOfSection = 4;

-(void)createSection:(float)xStart :(float)yStart: (bool)isOnLeftSide{
	
	PreventerLining *tempLining;
	sections = [[NSMutableArray alloc] init];
	
	float xPos = xStart;
	float yPos = yStart;
	
	int xIncrease = 40;
	
	for(int i=0;i<maxNumberOfLining;i++){
		tempLining = [[PreventerLining alloc] init];
		
		if(i != 0){
			tempLining.hidden = true;
		}
		
		CGPoint pPoint = CGPointMake(xPos, yPos);
		[tempLining setCenter:(pPoint)];
		[tempLining setXAndYPoints];
		[sections addObject:tempLining];
		
		//[self.view addSubview:tempLining];
		
		if(isOnLeftSide == true){
			xPos = xPos + xIncrease;}
		else{
			xPos = xPos - xIncrease;}
		
		[tempLining release];
	}
	printf("Section is created/n");
}

-(void)checkCollisionWithTrigger: (DustMite *) mite{
	
	for(PreventerLining *tempLining in sections) {
		
		if(CGRectIntersectsRect(tempLining.frame, mite.frame) && tempLining.hidden == false){

			if(tempLining.isLock){
				[tempLining hit];}
			
			[mite rebound];
		}
	}
}

-(void)repairSection{
	int index = 0;
	PreventerLining *tempLining;
	
	while(true){
		if(index = [sections count]){
			break;
		}
		
		tempLining = [sections objectAtIndex:index];
		
		if(tempLining.hidden == false || tempLining.Health == 2){
			index ++;
		}
		else{
			[tempLining isRepair];
			break;
		}
	}
}
/*
-(void)createMucus: (UIViewController*) viewController{
	PreventerLining *tempLining = [sections objectAtIndex:0];
	float tempX = tempLining.XPos;
	float tempY = tempLining.YPos;
	
	tempX = tempX - 25;
	tempY = tempY - 25;
	
	CGRect frame = CGRectMake(0, 0, 150, 50);
	UIView *mucusView = [[UIView alloc] initWithFrame: frame];
	[mucusView setBackgroundColor:(255)];
	CGPoint mucusPoints = CGPointMake(tempX, tempY);
	[mucusView setCenter:(mucusPoints)];
	
}*/


//-(PreventerLining *)getLastPoints{
	//int index = maxNumberOfLining - 1;
	//PreventerLining *tempLining;
	
	//while (true) {
		//tempLining = [sections objectAtIndex:index];
		
		//if(tempLining.hidden == false){
			//return tempLining;
		//}
		//else{
			//if(index = 0){
				//return tempLining;}
			//else{
				//index = index - 1;}
		//}
	//}
//}

-(NSMutableArray *)getSection{
	return sections;
}

@end
