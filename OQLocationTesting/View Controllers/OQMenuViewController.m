#import "OQMenuViewController.h"
#import "OQAuthenticationManager.h"

@interface OQMenuViewController ()

@end

@implementation OQMenuViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
}

- (IBAction)logout:(id)sender {
    [[OQAuthenticationManager sharedInstance] logout];
    
    // TODO: this should be done via KVO
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end