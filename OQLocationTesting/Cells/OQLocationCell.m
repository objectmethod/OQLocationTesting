#import "OQLocationCell.h"

@implementation OQLocationCell

- (void)setLocation:(OQLocation *)location {
    if (location != _location) {
        _location = location;
        
        self.textLabel.text = self.location.created_at.description;
        self.detailTextLabel.text = [NSString stringWithFormat:@"%f %f", self.location.latitudeValue, self.location.longitudeValue];
    }
}

@end
