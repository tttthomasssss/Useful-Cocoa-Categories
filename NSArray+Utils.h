//
//  NSArray+Utils.h
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

#import <Foundation/Foundation.h>

@interface NSArray (Utils)

/**
 * Unlike the method in the NSArray class in the Foundation Framework, these methods provide you with a return value.
 * So in case the selector performed on the objects in the Array returns something, these return values are collected
 * in the return Array and returned. Make sure the objects return value is itself an object, I might add functions
 * for primitive types sometime when I have time :)
 *
 * If the value returned by the object is nil, the value added to the return array will be [NSNull null]
 *
 * Btw, sorry for the epic name...I hate it myself...
 */
- (NSArray *)makeObjectsPerformSelectorWithReturnValue:(SEL)aSelector;
- (NSArray *)makeObjectsPerformSelectorWithReturnValue:(SEL)aSelector withObject:(id)argument;

@end
