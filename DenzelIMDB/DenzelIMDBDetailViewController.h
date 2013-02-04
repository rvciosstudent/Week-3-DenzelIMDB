//
//  DenzelIMDBDetailViewController.h
//  DenzelIMDB
//
//  Created by Charles Konkol on 2/2/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

//  Good Jobs

#import <UIKit/UIKit.h>

@interface DenzelIMDBDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (retain, nonatomic) IBOutlet UIWebView *WebSite;

@end
