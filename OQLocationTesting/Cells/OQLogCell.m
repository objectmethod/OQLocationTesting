#import "OQLogCell.h"

@implementation OQLogCell

- (void)setLog:(OQLog *)log {
    if (log != self.log) {
        _log = log;
        
        self.textLabel.text = self.log.created_at.description;
        self.detailTextLabel.text = self.log.message;
    }
}

@end
