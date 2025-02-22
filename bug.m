In Objective-C, a common yet subtle error arises from the misuse of `retain`, `release`, and `autorelease`.  Consider this scenario:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    NSString *tempString = [[NSString alloc] initWithString:@"Hello"];
    self.myString = tempString;
    [tempString release]; // ERROR: Double release if myString is already assigned
}
@end
```

The problem: If `myString` already held a string, assigning `tempString` to it would cause the old string to be released.  Subsequently releasing `tempString` explicitly leads to a double release, resulting in a crash.  This is particularly tricky because the error only appears under specific circumstances depending on the state of `myString`.