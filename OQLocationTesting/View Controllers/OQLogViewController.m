#import "OQLogViewController.h"

@interface OQLogViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailTextLabel;

@end

@implementation OQLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textLabel.text = self.log.created_at.description;
    self.detailTextLabel.text = self.log.message;
}

@end
