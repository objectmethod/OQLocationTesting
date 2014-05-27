#import "OQMenuViewController.h"
#import "OQAuthenticationManager.h"
#import "OQLocationManager.h"

@interface OQMenuViewController ()

@end

@implementation OQMenuViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    
    [[OQLocationManager sharedInstance] startUpdatingLocation];
}

- (IBAction)logout:(id)sender {
    [[OQAuthenticationManager sharedInstance] logout];
    
    // TODO: this should be done via KVO
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end