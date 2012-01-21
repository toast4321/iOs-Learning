//
//  EditBugViewController.m
//  ScaryBugs
//
//  Created by Tosin Onafowokan on 1/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EditBugViewController.h"
#import "ScaryBugDoc.h"
#import "ScaryBugData.h"
#import "UIImageExtras.h"

@implementation EditBugViewController

@synthesize bugDoc = _bugDoc;
@synthesize titleField = _titleField;
@synthesize imageView = _imageView;
@synthesize rateView = _rateView;
@synthesize picker = _picker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _rateView.notSelectedImage = [UIImage imageNamed:@"kermit_empty.png"];
    _rateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    _rateView.fullSelectedImage = [UIImage imageNamed:@"kermit_full.png"];
    _rateView.editable = YES;
    _rateView.maxRating = 5;
    _rateView.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

- (void)viewWillAppear:(BOOL)animated{
    _titleField.text = _bugDoc.data.title;
    _rateView.rating = _bugDoc.data.rating;
    _imageView.image = _bugDoc.fullImage;
    [super viewWillAppear:animated];
}

- (IBAction)titleFieldValueChanged:(id)sender{
    _bugDoc.data.title = _titleField.text;
}

#pragma mark UTextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark RateViewDelegate

- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating{
    _bugDoc.data.rating = rating;
}

- (IBAction)addPictureTapped:(id)sender{
    if (_picker == nil){
        self.picker = [[UIImagePickerController alloc] init];
        _picker.delegate = self;
        _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _picker.allowsEditing = NO;
    }
    
    [self.navigationController presentModalViewController:_picker animated:YES];
}

#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [self dismissModalViewControllerAnimated:YES];
    
    UIImage *fullImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *thumbImage = (UIImage *) [fullImage imageByScalingAndCroppingForSize:CGSizeMake(44,44)];
    _bugDoc.fullImage = fullImage;
    _bugDoc.thumbImage = thumbImage;
    _imageView.image = fullImage;
}

@end
