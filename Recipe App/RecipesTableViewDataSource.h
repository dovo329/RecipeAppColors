//
//  RecipesTableViewDataSource.h
//  Recipe App
//
//  Created by Justin Oakes on 4/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *cellID = @"cell";

@interface RecipesTableViewDataSource : NSObject <UITableViewDataSource>

-(void)regesterTableView:(UITableView *)tableView;

@end
