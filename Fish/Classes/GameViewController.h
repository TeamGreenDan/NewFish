//
//  GameViewController.h
//  Fish
//
//  Created by Daniel Loomb on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class PreventerArray;
//@class PreventerLining;



@interface GameViewController : UIViewController {
	UILabel *scoreLabel;
	UIButton *continueButton;
	UIButton *levelSelectButton;
	UIButton *mainMenuButton;
	UIButton *pauseButton;
	UIImageView *backgroundImage;
	UIImageView *pauseScreenFade;
}

-(IBAction)goToMainMenu;
-(IBAction)pause;
-(IBAction)continueGame;
-(IBAction)menuItemLevelSelect;



-(void)toggleTimer;

@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;
@property (nonatomic, retain) IBOutlet UIButton *continueButton;
@property (nonatomic, retain) IBOutlet UIButton *levelSelectButton;
@property (nonatomic, retain) IBOutlet UIButton *mainMenuButton;
@property (nonatomic, retain) IBOutlet UIButton *pauseButton;
@property (nonatomic, retain) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, retain) IBOutlet UIImageView *pauseScreenFade;

@end
