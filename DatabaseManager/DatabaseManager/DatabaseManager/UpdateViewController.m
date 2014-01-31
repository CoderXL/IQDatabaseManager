//
//  UpdateViewController.m
//  DatabaseManager
//
//  Created by Canopus 4 on 31/01/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import "UpdateViewController.h"
#import "MyDatabaseManager.h"

@interface UpdateViewController ()
{
    __weak IBOutlet UITextField *textFieldName;
    __weak IBOutlet UITextField *textFieldEmail;
    __weak IBOutlet UITextField *textFieldPhoneNumber;
    __weak IBOutlet UITextView *textViewComment;
}


@end

@implementation UpdateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    textFieldName.text = self.record.name;
    textFieldEmail.text = self.record.email;
    textFieldPhoneNumber.text = [NSString stringWithFormat:@"%@",self.record.phoneNumber];
    textViewComment.text = self.record.comment;

    
	// Do any additional setup after loading the view.
}

- (IBAction)updateClicked:(UIButton *)sender
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          textFieldName.text,kName,
                          textFieldEmail.text,kEmail,
                          [NSNumber numberWithInteger:[textFieldPhoneNumber.text integerValue]],kPhoneNumber,
                          textViewComment.text,kComment,
                          nil];

    [[MyDatabaseManager sharedManager] updateRecord:self.record inRecordTable:dict];

    [self.navigationController popViewControllerAnimated:YES];
}

@end