//
//  ViewPhotoViewController.m
//  Miscellaneous Photo Tracker
//
//  Created by Ryan D'souza on 7/9/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "ViewPhotoViewController.h"

@interface ViewPhotoViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImage *image;

@end

@implementation ViewPhotoViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil image:(UIImage *)image
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.image = image;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imageView setImage:self.image];
}


- (IBAction)cancelButton:(id)sender {
    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deleteButton:(id)sender {
    
}


@end
