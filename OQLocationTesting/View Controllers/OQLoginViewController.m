#import "OQLoginViewController.h"
#import "OQLoginController.h"
#import "MBProgressHUD.h"
#import "OQLocationViewController.h"

@interface OQLoginViewController () <NSURLSessionDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation OQLoginViewController

- (IBAction)login:(id)sender {
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[OQLoginController sharedInstance] loginWithUsername:username password:password success:^() {
        [hud hide:YES];
        [self showLocation];
    } failure:^(NSError *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error Logging In" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        [hud hide:YES];
    }];
}

- (void) showLocation {
    [self performSegueWithIdentifier:OQ_SHOW_LOCATION_SEGUE_IDENTIFIER sender:self];
}

@end
