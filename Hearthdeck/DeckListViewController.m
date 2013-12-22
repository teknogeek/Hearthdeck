//
//  DeckListViewController.m
//  Hearthdeck
//
//  Created by Michael Margolis on 12/21/13.
//  Copyright (c) 2013 Joel Margolis. All rights reserved.
//

#import "DeckListViewController.h"
#import "AddDeckViewController.h"
#import "Deck.h"

@interface DeckListViewController ()

@property (nonatomic, strong) NSMutableArray *decks;

- (IBAction)done:(UIStoryboardSegue *)segue;

@end

@implementation DeckListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    AddDeckViewController *addDeckVC = segue.sourceViewController;
    Deck *deck = [[Deck alloc] initWithName:addDeckVC.addDeckName];
    [self.decks addObject:deck];
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *deckFile = [documentsPath stringByAppendingPathComponent:@"file.txt"];
    NSError *error;
    if(error)
    {
        NSLog(@"Error: %@", error);
    }
    
    NSString *deckContent = [self.decks componentsJoinedByString:@""];
    
    [deckContent writeToFile:deckFile atomically:YES];
    
    NSString *content = [NSString stringWithContentsOfFile:deckFile encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"Content: %@", content);
    
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *deckFile = [documentsPath stringByAppendingPathComponent:@"file.txt"];
    NSString *initContents = [NSString stringWithContentsOfFile:deckFile encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"Initial Content: %@", initContents);
    
    self.decks = [NSMutableArray arrayWithObjects:initContents, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.decks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"deckCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        // More initializations if needed.
    }
        Deck *currentDeck = [self.decks objectAtIndex:indexPath.row];
        cell.textLabel.text = currentDeck.deckName;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
