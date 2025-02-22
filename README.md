# Objective-C Memory Management Error: Double Release

This repository demonstrates a common error in Objective-C memory management involving the improper use of `release` after assigning an object to a property.  The `bug.m` file contains the erroneous code, while `bugSolution.m` provides a corrected version.  The core issue is a double release when an object is explicitly released after being assigned to a property that already holds an object.

## How to reproduce:
1. Clone this repository.
2. Open `bug.m` and `bugSolution.m` in Xcode.
3. Build and run the code. (The incorrect version will likely crash; the correct version will function as expected.)

## Understanding the Solution
The primary cause of this issue lies in manual memory management and the property's strong reference counting behavior. When assigning an object to a `strong` property, the property takes ownership of the object. Manual `release` can lead to the object being released prematurely if it was already being managed elsewhere.