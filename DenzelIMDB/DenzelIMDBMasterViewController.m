//
//  DenzelIMDBMasterViewController.m
//  DenzelIMDB
//
//  Created by Charles Konkol on 2/2/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "DenzelIMDBMasterViewController.h"

#import "DenzelIMDBDetailViewController.h"

@interface DenzelIMDBMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation DenzelIMDBMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Movie", @"Movie");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}
							
- (void)dealloc
{
    [_detailViewController release];
    [_objects release];
    [super dealloc];
}

- (void)viewDidLoad
{
    // Add Code to Initialize Arrays
    //—-initialize  listOfMovies array—-
    listOfMovies = [[NSMutableArray alloc] init];
    [listOfMovies addObject:@"Training Day"];
    [listOfMovies addObject:@"Remember the Titans"];
    [listOfMovies addObject:@"John Q."];
    [listOfMovies addObject:@"The Bone Collector"];
    [listOfMovies addObject:@"Ricochet"];
    [listOfMovies addObject:@"The Siege"];
    [listOfMovies addObject:@"Malcolm X"];
    [listOfMovies addObject:@"Antwone Fisher"];
    [listOfMovies addObject:@"Courage Under Fire"];
    [listOfMovies addObject:@"He Got Game"];
    [listOfMovies addObject:@"The Pelican Brief"];
    [listOfMovies addObject:@"Glory"];
    [listOfMovies addObject:@"The Preacher’s Wife"];
    
    //—-initialize  MovieDetails array—-
    MovieDetails= [[NSMutableArray alloc] init];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0139654/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0210945/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0251160/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0145681/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0102789/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0133952/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0104797/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0168786/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0115956/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0124718/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0107798/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0097441/"];
    [MovieDetails addObject:@"http://www.imdb.com/title/tt0117372/"];
    
    //Comment out leftbarbutton logic since data is static
    
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    // UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self //action:@selector(insertNewObject:)] autorelease];
    //self.navigationItem.rightBarButtonItem = addButton;
    
    //Add Below code for iPad
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        //---
        self.detailViewController =
        (DenzelIMDBDetailViewController *) [[self.splitViewController.viewControllers lastObject] topViewController];

    [super viewDidLoad];
    }
	// Do any additional setup after loading the view, typically from a nib.
    // self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease];
    //self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Comment out return _objects.count;
    //return _objects.count;
    
    //add return for array listofmovies
    return [listOfMovies count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    //Comment out NSDate use in original logic
    //NSDate *object = _objects[indexPath.row];
    
    //Comment out exising cell.textlabel
    //cell.textLabel.text = [object description];
    
    //Add below code referencing listofMovies
    cell.textLabel.text = [listOfMovies objectAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Comment out below line
    //NSDate *object = _objects[indexPath.row];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        if (!self.detailViewController) {
            self.detailViewController = [[[DenzelIMDBDetailViewController alloc] initWithNibName:@"DenzelIMDBDetailViewController_iPhone" bundle:nil] autorelease];
        }
        //comment out below line
        //self.detailViewController.detailItem = object;
        //---
        //closes Menu
        self.detailViewController.detailItem =
        [NSString stringWithFormat:@"loadingmovie"];
        //loads url into webview on iPhone
        NSURL *url = [NSURL URLWithString:[MovieDetails objectAtIndex:indexPath.row]];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [self.detailViewController.WebSite loadRequest:req];
        
        //---
        
        [self.navigationController pushViewController:self.detailViewController animated:YES];
    }
    //---
    else
    {
        //closes Menu
        self.detailViewController.detailItem =
        [NSString stringWithFormat:@"loadingmovie"];
        //loads url into webview on iPad
        NSURL *url = [NSURL URLWithString:[MovieDetails objectAtIndex:indexPath.row]];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [self.detailViewController.WebSite loadRequest:req];
    }
    //self.detailViewController.detailItem = object;
   
}

@end
