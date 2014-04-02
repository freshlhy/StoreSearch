//
//  DetailViewController.m
//  StoreSearch
//
//  Created by freshlhy on 14-3-31.
//  Copyright (c) 2014年 freshlhy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "DetailViewController.h"
#import "SearchResult.h"
#import "GradientView.h"

@interface DetailViewController () <UIGestureRecognizerDelegate>

@property(nonatomic, weak) IBOutlet UIView *popupView;
@property(nonatomic, weak) IBOutlet UIImageView *artworkImageView;
@property(nonatomic, weak) IBOutlet UILabel *nameLabel;
@property(nonatomic, weak) IBOutlet UILabel *artistNameLabel;
@property(nonatomic, weak) IBOutlet UILabel *kindLabel;
@property(nonatomic, weak) IBOutlet UILabel *genreLabel;
@property(nonatomic, weak) IBOutlet UIButton *priceButton;

@end

@implementation DetailViewController {
    GradientView *_gradientView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [[UIImage imageNamed:@"PriceButton"]
        resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];

    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    [self.priceButton setBackgroundImage:image forState:UIControlStateNormal];

    self.view.tintColor = [UIColor colorWithRed:20 / 255.0f
                                          green:160 / 255.0f
                                           blue:160 / 255.0f
                                          alpha:1.0f];

    self.popupView.layer.cornerRadius = 10.0f;

    UITapGestureRecognizer *gestureRecognizer =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(close:)];
    gestureRecognizer.cancelsTouchesInView = NO;
    gestureRecognizer.delegate = self;

    [self.view addGestureRecognizer:gestureRecognizer];

    if (self.searchResult != nil) {
        [self updateUI];
    }

    self.view.backgroundColor = [UIColor clearColor];
}

- (void)updateUI {
    self.nameLabel.text = self.searchResult.name;
    NSString *artistName = self.searchResult.artistName;
    if (artistName == nil) {
        artistName = @"Unknown";
    }
    self.artistNameLabel.text = artistName;
    self.kindLabel.text = [self.searchResult kindForDisplay];
    self.genreLabel.text = self.searchResult.genre;

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setCurrencyCode:self.searchResult.currency];
    NSString *priceText;
    if ([self.searchResult.price floatValue] == 0.0f) {
        priceText = @"Free";
    } else {
        priceText = [formatter stringFromNumber:self.searchResult.price];
    }
    [self.priceButton setTitle:priceText forState:UIControlStateNormal];

    [self.artworkImageView
        setImageWithURL:[NSURL URLWithString:self.searchResult.artworkURL100]];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
       shouldReceiveTouch:(UITouch *)touch {
    return (touch.view == self.view);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openInStore:(id)sender {
    [[UIApplication sharedApplication]
        openURL:[NSURL URLWithString:self.searchResult.storeURL]];
}

- (void)presentInParentViewController:(UIViewController *)parentViewController {
    
    _gradientView = [[GradientView alloc]
                     initWithFrame:parentViewController.view.bounds];
    [parentViewController.view addSubview:_gradientView];
    
    self.view.frame = parentViewController.view.bounds;
    [parentViewController.view addSubview:self.view];
    [parentViewController addChildViewController:self];
    CAKeyframeAnimation *bounceAnimation =
        [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    bounceAnimation.duration = 0.4;
    bounceAnimation.delegate = self;
    bounceAnimation.values = @[ @0.7, @1.2, @0.9, @1.0 ];
    bounceAnimation.keyTimes = @[ @0.0, @0.334, @0.666, @1.0 ];
    bounceAnimation.timingFunctions = @[
        [CAMediaTimingFunction
            functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
        [CAMediaTimingFunction
            functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
        [CAMediaTimingFunction
            functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
    ];
    [self.view.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self didMoveToParentViewController:self.parentViewController];
}

- (IBAction)close:(id)sender {
    [self dismissFromParentViewController];
}

- (void)dismissFromParentViewController {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)dealloc {
    NSLog(@"dealloc %@", self);
    [self.artworkImageView cancelImageRequestOperation];
}

@end
