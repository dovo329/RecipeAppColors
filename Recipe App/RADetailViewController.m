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

static CGFloat margin = 150;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    
    CGFloat contentSize = 0;
    CGFloat lableY = 15;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    NSArray *lables = @[@"Description", @"Ingredients", @"Direction"];
    
    for (NSString *i in lables) {
        UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, lableY, 100, 50)];
        newLabel.text = i;
        [scrollView addSubview:newLabel];
        
        contentSize += margin + CGRectGetHeight([newLabel bounds]);
        lableY += 50 + margin;
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
