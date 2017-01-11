//
//  ViewController.h
//  MayurGoogleAPI
//
//  Created by Felix-ITS 012 on 11/01/17.
//  Copyright © 2017 Felix-ITS 012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *tf1;

@property (strong, nonatomic) IBOutlet UITableView *tableview;

@property(nonatomic,strong)NSMutableArray *tablearray;

@end

