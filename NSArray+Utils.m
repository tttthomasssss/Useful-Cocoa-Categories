//
//  NSArray+Utils.m
//
//  Created by Thomas Kober on 9/16/11.
//  Copyright (c) 2012 Thomas Kober. All rights reserved.
//
//	The MIT License (MIT)
//	
//	In a Nutshell:
//
//	Do whatever you want with this source, but don't blame me when things go wrong ;)
//
//
// 	Permission is hereby granted, free of charge, to any person obtaining a copy of 
//	this software and associated documentation files (the "Software"), to deal in the 
//	Software without restriction, including without limitation the rights to use, copy, 
//	modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
//	and to permit persons to whom the Software is furnished to do so, subject to the 
//	following conditions:
//
//	The above copyright notice and this permission notice shall be included in all copies 
//	or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
//	INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
//	PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
//	FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
//	OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
//	DEALINGS IN THE SOFTWARE.
//

#import "NSArray+Utils.h"

@implementation NSArray (Utils)

- (NSArray *)makeObjectsPerformSelectorWithReturnValue:(SEL)aSelector
{
    return [self makeObjectsPerformSelectorWithReturnValue:aSelector withObject:nil];
}

- (NSArray *)makeObjectsPerformSelectorWithReturnValue:(SEL)aSelector withObject:(id)argument
{
    NSMutableArray *returnArray = [NSMutableArray array];
    id returnValue = nil;
    
    for (id obj in self) {
        
        if (!argument) {
            returnValue = [obj performSelector:aSelector];
        } else {
            returnValue = [obj performSelector:aSelector withObject:argument];
        }
        
        if (!returnValue) { // Check that returnValue is not null, otherwise we crash when adding to the array
            returnValue = [NSNull null];
        }
        
        [returnArray addObject:returnValue];
        
        returnValue = nil;
    }
    
    return (NSArray *)returnArray;
}

@end
