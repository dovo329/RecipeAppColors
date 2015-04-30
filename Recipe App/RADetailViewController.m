//
//  RADetailViewController.m
//  Recipe App
//
//  Created by Douglas Voss on 4/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RADetailViewController.h"
#import "RARecipes.h"

@implementation UIFont (Utils)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

static const NSString *fontName = @"Chalkduster";

+ (UIFont *)systemFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:fontName size:size];
}

+ (UIFont *)lightSystemFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:fontName size:size];
}

+ (UIFont *)boldSystemFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:fontName size:size];
}

+ (UIFont *)preferredFontForTextStyle:(NSString *)style
{
    if ([style isEqualToString:UIFontTextStyleBody])
        return [UIFont systemFontOfSize:17];
    if ([style isEqualToString:UIFontTextStyleHeadline])
        return [UIFont boldSystemFontOfSize:17];
    if ([style isEqualToString:UIFontTextStyleSubheadline])
        return [UIFont systemFontOfSize:15];
    if ([style isEqualToString:UIFontTextStyleFootnote])
        return [UIFont systemFontOfSize:13];
    if ([style isEqualToString:UIFontTextStyleCaption1])
        return [UIFont systemFontOfSize:12];
    if ([style isEqualToString:UIFontTextStyleCaption2])
        return [UIFont systemFontOfSize:11];
    return [UIFont systemFontOfSize:17];
}

#pragma clang diagnostic pop

@end


@interface RADetailViewController ()

@end

@implementation RADetailViewController

static const CGFloat xMargin = 15;
static const CGFloat interItemMargin = 0;

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * xMargin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:nil//@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
    
}

- (CGFloat)heightOfCell:(NSString *)text
     withSuperviewWidth:(CGFloat)superviewWidth
{
    CGFloat labelWidth                  = superviewWidth - 30.0f;
    //    use the known label width with a maximum height of 100 points
    CGSize labelContraints              = CGSizeMake(labelWidth, 100.0f);
    
    NSStringDrawingContext *context     = [[NSStringDrawingContext alloc] init];
    
    CGRect labelRect                    = [text boundingRectWithSize:labelContraints
                                                                       options:NSStringDrawingUsesLineFragmentOrigin
                                                                    attributes:nil
                                                                       context:context];
    
    //    return the calculated required height of the cell considering the label
    return labelRect.size.height;
}

- (CGFloat)heightForText:(NSString*)text font:(UIFont*)font withinWidth:(CGFloat)width {
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    NSLog(@"size.width = %f; size.height = %f", size.width, size.height);
    CGFloat area = size.height * size.width;
    CGFloat height = roundf(area / (width));
    NSLog(@"height = %f", height);
    return ceilf(height / font.lineHeight) * font.lineHeight;
    //return ceilf(height);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    
    CGFloat topMargin = 0;
    
    CGRect scrollViewFrame = CGRectMake(0, topMargin, self.view.frame.size.width, self.view.frame.size.height);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    NSArray *lables = @[@"Description", @"Ingredients", @"Directions"];
    
    NSString *textLableText = nil;
    for (NSString *i in lables) {
        UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectMake(xMargin, topMargin, CGRectGetWidth(self.view.frame) - 2*xMargin, [self heightOfReferenceString:textLableText])];
        newLabel.text = i;
        newLabel.backgroundColor = [UIColor blueColor];
        newLabel.numberOfLines = 0;
        [newLabel sizeToFit];
        [scrollView addSubview:newLabel];
        topMargin += CGRectGetHeight(newLabel.frame);
        
        textLableText = nil;
        textLableText = [self detailTextForLable:i];
        
        //textLableText = [textLableText stringByAppendingFormat:@"%@ ", i];
        
        NSLog(@"\n\ntextLableText=%@\n\n", textLableText);
        //CGRect frame = [textLableText boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.view.frame) - 25, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil];
        //frame.origin = CGPointMake(25, topMargin);
    
        
        
        UILabel *textLabel= [[UILabel alloc] init];
        
        //[textLabel setNumberOfLines:0];
        //textLabel.text = textLableText;
        
        textLabel.numberOfLines = 0; // allows label to have as many lines as needed
        textLabel.text = textLableText;
        //[textLabel sizeToFit];
        //textLabel.frame = CGRectMake(15, topMargin, self.view.frame.size.width - 2*15, [self heightOfCell:textLabel.text withSuperviewWidth:(self.view.frame.size.width - 2*15)]);
        //textLabel.frame = CGRectMake(xMargin, topMargin, self.view.frame.size.width - 2*xMargin, [self heightForText:textLabel.text font:textLabel.font withinWidth:self.view.frame.size.width]);
        textLabel.frame = CGRectMake(xMargin, topMargin, self.view.frame.size.width - 2*xMargin, [self heightOfReferenceString:textLabel.text]);
        
        NSLog(@"textlabel.text=%@", textLabel.text);
        NSLog(@"Label's frame is: %f, %f, %f, %f", textLabel.frame.origin.x, textLabel.frame.origin.y, textLabel.frame.size.width, textLabel.frame.size.height);
        
        textLabel.backgroundColor = [UIColor redColor];
        textLabel.numberOfLines = 0;
        [textLabel sizeToFit];
        [scrollView addSubview:textLabel];
        topMargin +=  interItemMargin + CGRectGetHeight(textLabel.frame);
   
   }
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), topMargin);
    [self.view addSubview:scrollView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString *)detailTextForLable:(NSString *)lable{
    if ([lable isEqualToString:@"Description"]) {
        return [RARecipes descriptionAtIndex:self.recipeIndex];
    }else if ([lable isEqualToString:@"Ingredients"]){
        
        NSString *catString = @"";
        int thresh = [RARecipes ingredientCountAtIndex:self.recipeIndex];
        for (int i=0; i<thresh; i++) {
            catString = [catString stringByAppendingString:[NSString stringWithFormat:@"%@ %@\n", [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex], [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex]]];
        }
        // get rid of last \n character
        return [catString substringToIndex:[catString length]-1];
        
    }else{
        NSString *directionsString = @"";
        for (NSString *part in [RARecipes directionsAtIndex:self.recipeIndex]) {
            directionsString = [directionsString stringByAppendingString:part];
        }
        return  directionsString;
    }
    return @"NO VALUE";
}
    


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
