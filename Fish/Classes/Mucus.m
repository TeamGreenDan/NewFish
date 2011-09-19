//
//  Mucus.m
//  Fish
//
//  Created by Billy-Jo Hunia on 19/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Mucus.h"
#import "PreventerLining.h"


@implementation Mucus

UIViewController *mucusView;

-(id)initWithViewController:(UIViewController *) ViewUI{
	if(self){
		mucusView =	ViewUI;
	}
	
	return self;
}

-(void)spawnMucus: (PreventerLining *) destryLining{
	float tempX = destryLining.XPos;
	float tempY = destryLining.YPos;
	
	tempX = tempX - 25;
	tempY = tempY - 25;
	
	CGRect frame = CGRectMake(0, 0, 150, 50);
	UIView *mucusSpawn = [[UIView alloc] initWithFrame: frame];
	[mucusSpawn setBackgroundColor:[UIColor colorWithRed:0 green:255 blue:0 alpha:1]];
	CGPoint mucusPoints = CGPointMake(tempX, tempY);
	[mucusSpawn setCenter:(mucusPoints)];
	[mucusView.view addSubview:mucusSpawn];	
}

@end
