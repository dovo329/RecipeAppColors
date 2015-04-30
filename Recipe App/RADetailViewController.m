//
//  RADetailViewController.m
//  Recipe App
//
//  Created by Douglas Voss on 4/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RADetailViewController.h"
#import "RARecipes.h"

@interface RADetailViewController ()

@end

@implementation RADetailViewController

static CGFloat margin = 25;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    
    CGFloat contentSize = 0;
    CGFloat lableY = 15;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    NSArray *lables = @[@"Description", @"Ingredients", @"Direction"];
    NSArray *textArray = @[[RARecipes directionsAtIndex:self.recipeIndex], [RARecipes recipeAtIndex:self.recipeIndex][@"recipeIngredients"],[RARecipes recipeAtIndex:self.recipeIndex][@"directions"]];
    
    for (NSString *i in lables) {
        UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, lableY, CGRectGetWidth(self.view.frame) -15, 20)];
        newLabel.text = i;
        [scrollView addSubview:newLabel];
        contentSize += margin + CGRectGetHeight(newLabel.frame);
        lableY += margin + 20;
        
        NSString *textLableText = @"";
        for (NSString *i in textArray[0]) {
            textLableText = [textLableText stringByAppendingFormat:@"%@ ", i];
        }

        CGRect frame = [textLableText boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.view.frame) - 25, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil];
        frame.origin = CGPointMake(25, lableY);
        UILabel *textLabel= [[UILabel alloc] initWithFrame:frame];

        [textLabel setNumberOfLines:0];
        textLabel.text = textLableText;
        [scrollView addSubview:textLabel];
        contentSize += margin + CGRectGetHeight(textLabel.frame);
        lableY +=  margin + CGRectGetHeight(textLabel.frame);
   
   }
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), contentSize);
    [self.view addSubview:scrollView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
