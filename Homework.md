IMDBDenzel Movie Apps

ScreenShot of App: http://screencast.com/t/hiRWbAssks

1) Open XCode. File > New Project > Master-Detail Application > Next
  
  - Fill out App Info: image://http://screencast.com/t/B7gNxJAbwIb
   
  - Click NEXT
  
  - Save project in MAC Folder. DO NOT CLICK SOURCE CONTROL
  
  - Click Create
   


2) Go to Page: DenzelIMDBMasterViewController.h and add the lines under the @interface line of code


    @interface DenzelIMDBMasterViewController : UITableViewController
    {
        //Declare Arrays
        NSMutableArray *listOfMovies;
        NSMutableArray *MovieDetails;
    }
    
3) Go to Page: DenzelIMDBMasterViewController.m

4) Go to function: - (void)viewDidLoad
   and initilize 2 arrays, comment out lines, add code for iPad
   
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
    
    //Comment Out Below Code so users cannot add new items or delete items from  list
    // Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self
        //self.navigationItem.rightBarButtonItem = addButton;
    }

    
4) Go to Function: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
   
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        //Comment out return _objects.count;
        //return _objects.count;
        
        //add return for array listofmovies
        return [listOfMovies count];
    }
   
5) Go to Function: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
   add below code and comments
   
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
   
6) Add UIWebView to iPad and iPhone.Make sure and check "Scale Page to fit" 

7) Connect both UIWebViews to File Owner and select WebView

   - CTRL+CLICK+DRAG UIWebView to DenzelIMDBDetailViewController.h
   - See http://screencast.com/t/t5MGiLOD

        #import <UIKit/UIKit.h>
        
        @interface DenzelIMDBDetailViewController : UIViewController <UISplitViewControllerDelegate>
        
        @property (strong, nonatomic) id detailItem;
        
        @property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
        
        @property (retain, nonatomic) IBOutlet UIWebView *WebSite;
        
        @end
   
8) Connect both UIWebViews to File Owner and select WebView

   - CTRL+CLICK+DRAG UIWebView for iPad and iPhone .xib files to File Owner
   - Click on WebSite object to complete connection for iPad and iPhone UIWebView object

9) Go to page: DenzelIMDBDetailViewController.m and add code for @sythesize

    @implementation DenzelIMDBDetailViewController
    //Add @sythesize Code
    @synthesize detailItem = _detailItem;
    @synthesize detailDescriptionLabel = _detailDescriptionLabel;
    @synthesize masterPopoverController = _masterPopoverController;
    @synthesize WebSite = _WebSite;
   
10) Go to Page: DenzelIMDBMasterViewController.m 
  
  Function: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    
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


11) Change titles of menu in MasterView and DetailView

Open and edit self.title line for DenzelIMDBMasterViewController.m
    
    - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Change Title
        self.title = NSLocalizedString(@"Movie", @"Movie");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
    }
    
Open and edit self.title lines for DenzelIMDBDetailViewController.m
    
    - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Title of Middle DetailView
        self.title = NSLocalizedString(@"IMDB Info", @"IMDB Info");
    }
    return self;
    }
    
    
    - (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
    {
      //Title of Left DetailView
    barButtonItem.title = NSLocalizedString(@"Movie", @"Movie");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
    }
        
12) Add Icon

    - Make sure you have added 2 images in Supporting Files folder for Universal Apps
      * 57x57 size for iPhone
      * 72x72 size for iPad
      I use http://pixlr.com to create images. Images can be .jpg
    - Click on each image in supporting files folder then click the "Make Localize Button"
    
   See Screenshot of Making Localized: image://http://screencast.com/t/JMfaGsljCxOq
   
    - Open Page: Supporting Files/IMDB Denzel-Info.plist
    - Edit Page by clicking the + symbol twice next to add 2 new image names.
      (Images for icons need to be 72x72 iPad, 57x57 iPhone)
    - type in the name of the photos located in the supporting file
    
13 Test APP!
    



