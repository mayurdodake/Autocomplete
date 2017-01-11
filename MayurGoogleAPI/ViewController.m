//
//  ViewController.m
//  MayurGoogleAPI
//
//  Created by Felix-ITS 012 on 11/01/17.
//  Copyright © 2017 Felix-ITS 012. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SaveData.h"
#import "Places.h"

@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _tablearray=[[NSMutableArray alloc]init];
    
    
    
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _tableview.hidden=YES;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tablearray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Places *obj=[_tablearray objectAtIndex:indexPath.row];
    
    cell.textLabel.text=obj.placename;
    
    return cell;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
   }

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    _tableview.hidden=NO;
    
    NSString *url=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@&types=(cities)&language=pt_BR&key=AIzaSyA6OkkSy_soiLFEmr3rXxNJI5qOxLEwSKM",_tf1.text];
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSURLSessionConfiguration *configuration=[NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session=[NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *task1=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSArray *resultarray=[dict objectForKey:@"predictions"];
        NSLog(@"%@",resultarray);
        
        for(NSDictionary *temp in resultarray)
        {
            Places *p=[[Places alloc]init];
            
            p.placename=[temp objectForKey:@"description"];
            
            [_tablearray addObject:p];
            
            
            
        }
        [self.tableview reloadData];
        
        
    }];
    
    [task1 resume];


    return YES;
    
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    SaveData *s=[[SaveData alloc]init];
//    s.place=[_tablearray objectAtIndex:indexPath.row];
//    
//    NSLog(@"%@",s.place);
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
