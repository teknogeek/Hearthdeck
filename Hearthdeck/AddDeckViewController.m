//
//  AddDeckViewController.m
//  Hearthdeck
//
//  Created by Michael Margolis on 12/21/13.
//  Copyright (c) 2013 Joel Margolis. All rights reserved.
//

#import "AddDeckViewController.h"

@interface AddDeckViewController ()

@end

@implementation AddDeckViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"doneSegue"])
    {
        self.addDeckName = self.name.text;
    } 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
