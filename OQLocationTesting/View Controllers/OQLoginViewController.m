#import "OQLoginViewController.h"
#import "OQLoginController.h"
#import "MBProgressHUD.h"
#import "OQMapViewController.h"

@interface OQLoginViewController () <NSURLSessionDelegate>

@property (strong, nonatomic) MBProgressHUD *hud;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation OQLoginViewController

- (IBAction)login:(id)sender {
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [self loginTo1Q];
    [self showMenu];
}

- (void) loginTo1Q {
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    [[OQLoginController sharedInstance] loginWithUsername:username password:password success:^() {
        [self showMenu];
    } failure:^(NSError *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error Logging In" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        [self.hud hide:YES];
    }];
}

- (void) showMenu {
    [self.hud hide:YES];
    [self performSegueWithIdentifier:OQ_SHOW_MENU_SEGUE_IDENTIFIER sender:self];
}

@end
