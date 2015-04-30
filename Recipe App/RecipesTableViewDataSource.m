//
//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Justin Oakes on 4/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"

@implementation RecipesTableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [RARecipes count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [RARecipes recipeAtIndex:indexPath.row][@"recipeTitle"];

    cell.detailTextLabel.text = [RARecipes descriptionAtIndex:indexPath.row];
    
    return cell;
    
}


@end
