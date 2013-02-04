//
//  DenzelIMDBMasterViewController.h
//  DenzelIMDB
//
//  Created by Charles Konkol on 2/2/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DenzelIMDBDetailViewController;

@interface DenzelIMDBMasterViewController : UITableViewController
{
    //Declare Arrays
    NSMutableArray *listOfMovies;
    NSMutableArray *MovieDetails;
}

@property (strong, nonatomic) DenzelIMDBDetailViewController *detailViewController;

@end
