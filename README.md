KRNTimeout
===============

KRNTimeout is a class that allows you to start, handle and stop timeouts. Class can be useful for working with network and asynchronous operations using Core Bluetooth, Multipeer Connectivity Framework etc.


## Installation
####CocoaPods

Just add `pod 'KRNTimeout'` to your Podfile and run `pod install` in Terminal from your project folder.

Write `#import "KRNTimeout.h"` in files where you need to use KRNTimeout class and its instances.


## How to use
Usage of KRNTimeout is very simple.
For example, to create timeout that expires in 2 seconds you can use next code:
```objc
[KRNTimeout timeoutWithSeconds:2.f andFiredBlock:^{
    // block will be called when timeout expires    
}];
```
Of course, you can create instances of KRNTimeout class and stop timeout if event connected with them occurred before timeout expiration.

```objc
KRNTimeout *timeout = [[KRNTimeout alloc]initWithSeconds:2.f];
[timeout startWithBlock:^{
   // block will be called when timeout expires if timeout hasn't been stopped before its expiration
}];
...
[timeout stop]; // stop timeout

```
## Requirements

* iOS 8.0 and above
* XCode 6+

## License

KRNBluetoothKit is released under the MIT license. See LICENSE for details.

## Contact

Any suggestion or question? Please create a Github issue or reach me out.

[LinkedIn](https://www.linkedin.com/in/julian-drapaylo)
