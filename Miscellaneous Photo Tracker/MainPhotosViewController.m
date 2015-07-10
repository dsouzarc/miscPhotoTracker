//
//  MainPhotosViewController.m
//  Miscellaneous Photo Tracker
//
//  Created by Ryan D'souza on 7/7/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "MainPhotosViewController.h"

static NSString *imageCellIdentifier = @"ImageCell";

@interface MainPhotosViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *allPictures;
@property (strong, nonatomic) ViewPhotoViewController *viewPhotoVC;

@end

@implementation MainPhotosViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.allPictures = [[NSMutableArray alloc] init];
        
        NSMutableArray *firstSection = [[NSMutableArray alloc] init];
        NSMutableArray *secondSection = [[NSMutableArray alloc] init];
        for (int i=0; i<50; i++) {
            [firstSection addObject:[NSString stringWithFormat:@"Cell %d", i]];
            [secondSection addObject:[NSString stringWithFormat:@"item %d", i]];
        }
        
        [self.allPictures addObject:firstSection];
        [self.allPictures addObject:secondSection];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"Image" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:imageCellIdentifier];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(98, 170)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:flowLayout];
}


- (IBAction)editPhotosButton:(id)sender {
    
}

- (IBAction)goToOldPhotosButton:(id)sender {
    
}

#pragma mark - UICollectionView Datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.allPictures.count;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray *sectionArray = self.allPictures[section];
    return sectionArray.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *array = self.allPictures[indexPath.section];
    UIImage *image = [UIImage imageNamed:@"tc.png"]; //array[indexPath.row];
    
    self.viewPhotoVC = [[ViewPhotoViewController alloc] initWithNibName:@"ViewPhotoViewController" bundle:[NSBundle mainBundle] image:image];
    
    self.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:self.viewPhotoVC animated:YES completion:nil];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:imageCellIdentifier forIndexPath:indexPath];
    
    NSMutableArray *array = self.allPictures[indexPath.section];
    NSString *fileName = array[indexPath.row];
    
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:100];
    imageView.image = [UIImage imageNamed:@"tc.png"];
    return cell;
    
}

@end
