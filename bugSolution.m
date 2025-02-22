@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    NSString *tempString = [[NSString alloc] initWithString:@"Hello"];
    self.myString = tempString;
    // No need to release tempString here; the property handles it.
}
@end

// Or using ARC (Automatic Reference Counting):

@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    NSString *tempString = [NSString stringWithString:@"Hello"]; //ARC handles memory
    self.myString = tempString;
}
@end