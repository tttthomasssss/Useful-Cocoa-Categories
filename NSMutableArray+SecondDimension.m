//
//  NSMutableArray+SecondDimension.m
//
//  Created by Thomas Kober on 3/29/12.
//
//	The MIT License (MIT)
//
// 	Copyright (c) 2012 Thomas Kober
//	
// 	Also, this one was very much inspired by:
//	http://stackoverflow.com/questions/3261329/how-to-create-a-2d-nsarray-or-nsmutablearray-in-objective-c
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

#import "NSMutableArray+SecondDimension.h"

@implementation NSMutableArray (SecondDimension)

+ (NSMutableArray *) arrayWithRows:(NSUInteger)rows andColumns:(NSUInteger)columns 
{
    return [[[self alloc] initWithRows:rows andColumns:columns] autorelease];
}

- (id)initWithRows:(NSUInteger)rows andColumns:(NSUInteger)columns
{
    self = [self initWithCapacity:rows];
    
    NSMutableArray *inner = nil;
    
    for (NSUInteger i = 0; i < rows; i++) {
        
        inner = [NSMutableArray arrayWithCapacity:columns];
        
        [self addObject:inner];
    }
    
    return self;
}

- (id) objectAtRow:(NSUInteger)row andColumn:(NSUInteger)column
{
    return [[self objectAtIndex:row] objectAtIndex:column];
}

- (void)insertObject:(id)anObject inRow:(NSUInteger)row andColumn:(NSUInteger)column
{
    NSMutableArray *inner = [self objectAtIndex:row];
    
    [inner insertObject:anObject atIndex:column];
}

@end
