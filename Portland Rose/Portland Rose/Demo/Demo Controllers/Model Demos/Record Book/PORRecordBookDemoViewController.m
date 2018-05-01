//
//  PORRecordBookDemoViewController.m
//  Portland Rose
//
//  Created by Hunter Ford on 25/04/2018.
//  Copyright © 2018 Useless Corporation. All rights reserved.
//

#import "PORRecordBookDemoViewController.h"

/// Reuse identifier
static NSString * const REUSE_IDENTIFIER_CELL = @"PuffinCell";
/// Text to display on the cancel button of the create puffin alert
static NSString * const TEXT_ALERT_CREATE_PUFFIN_CANCEL = @"Cancel";
/// Text to display on the submit button of the create puffin alert
static NSString * const TEXT_ALERT_CREATE_PUFFIN_CONFIRM = @"O.K.";
/// Subtitle text for the create puffin alert
static NSString * const TEXT_ALERT_CREATE_PUFFIN_SUBTITLE = @"Create your very own puffin!  Please give your puffin an I.D. and a name.";
/// Title text for the create puffin alert
static NSString * const TEXT_ALERT_CREATE_PUFFIN_TITLE = @"Add A Puffin";
/// Placeholder text for the I.D. field of the create puffin alert
static NSString * const TEXT_ALERT_CREATE_PUFFIN_PLACEHOLDER_ID = @"I.D.";
/// Name text for the I.D. field of the create puffin alert
static NSString * const TEXT_ALERT_CREATE_PUFFIN_PLACEHOLDER_NAME = @"Puffin Name";
/// Text to display on the add puffin button
static NSString * const TEXT_BUTTON_ADD = @"Add";


@interface PORRecordBookDemoViewController ()

/// Array of puffins to display
@property NSArray <PORPuffin *> * data;
/// Puffin record book
@property PORPuffins * puffins;

@end

@implementation PORRecordBookDemoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle: @"Record Book Demo"];
  [self addAddButton];
  [self loadPuffins];
}

#pragma mark - helpers

/**
 * Add an "Add" button to the U.I. and set its target / action.
 */
- (void) addAddButton{
  UIBarButtonItem * addButton;
  
  addButton = [[UIBarButtonItem alloc] initWithTitle:TEXT_BUTTON_ADD style:UIBarButtonItemStylePlain target:self action:@selector(didTapAdd:)];
  self.navigationItem.rightBarButtonItem = addButton;
}

/**
 * Adds a new puffin entry to the puffin record book.
 */
- (void) createPuffinWithId: (NSString *) identifier andName: (NSString *) name{
  NSNumberFormatter * f;
  PORPuffin * puffin;
  NSUInteger i;
  
  f = [[NSNumberFormatter alloc] init];
  f.numberStyle = NSNumberFormatterDecimalStyle;
  i = [[f numberFromString:identifier] unsignedIntegerValue];
  
  puffin = [PORPuffin new];
  puffin.identifier = i;
  puffin.name = name;
  [_puffins createRecord: puffin];
}


/**
 * Initialize `self.puffins` and set its delegate; refresh data.
 */
- (void) loadPuffins{
  _puffins = [PORPuffins sharedRecordBook];
  [_puffins setDelegate:self];
  [self refresh];
}

/**
 * Refresh displayed puffins by first refreshing `data` and then
 * reloading `self.tableView`.
 */
- (void) refresh{
  _data = (NSArray <PORPuffin *> *)[_puffins allRecords];
  [self.tableView reloadData];
}

/**
 * Show an alert that allows the user to create a new `PORPuffin`
 * record.  The alert has a field for the new puffin's I.D. and name.
 */
- (void) showCreatePuffinAlert{
  UIAlertController * alert = [UIAlertController alertControllerWithTitle:TEXT_ALERT_CREATE_PUFFIN_TITLE
                             message:TEXT_ALERT_CREATE_PUFFIN_SUBTITLE
                             preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction * ok = [UIAlertAction actionWithTitle:TEXT_ALERT_CREATE_PUFFIN_CONFIRM style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
    UITextField * idField;
    UITextField * nameField;
    
    idField = alert.textFields[0];
    nameField = alert.textFields[1];
    [self createPuffinWithId:idField.text andName:nameField.text];
  }];
  
  UIAlertAction * cancel = [UIAlertAction actionWithTitle:TEXT_ALERT_CREATE_PUFFIN_CANCEL style:UIAlertActionStyleDefault
      handler:^(UIAlertAction * action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
      }];
  
  [alert addAction:ok];
  [alert addAction:cancel];
  
  [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
    textField.placeholder = TEXT_ALERT_CREATE_PUFFIN_PLACEHOLDER_ID;
    textField.keyboardType = UIKeyboardTypeNumberPad;
  }];
  [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
    textField.placeholder = TEXT_ALERT_CREATE_PUFFIN_PLACEHOLDER_NAME;
    textField.keyboardType = UIKeyboardTypeDefault;
  }];
  
  [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - events

- (void) didTapAdd: (id) sender{
  [self showCreatePuffinAlert];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell * cell;
  
  cell = [tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER_CELL];
  [cell.textLabel setText: _data[indexPath.row].name];
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data count];
}

#pragma mark - <PORRecordBookDelegate>

- (void)didUpdateRecordBook:(PORRecordBook *)recordBook{
  [self refresh];
}




@end
