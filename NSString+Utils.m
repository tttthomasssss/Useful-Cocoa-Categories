//
//  NSString+Utils.m
//
//  Created by Thomas Kober on 14/10/2011.
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

#import "NSString+Utils.h"


@implementation NSString (Utils)

- (NSString *)stringByTrimmingWhitespaceCharactersInString
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)stringByTrimmingWhitespaceAndNewlineCharactersInString
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/*--------------------------------------------------------------------------------------------------------------------------*/
/* Returns wether or not a given String consists of numbers only                                                            */
/*--------------------------------------------------------------------------------------------------------------------------*/
- (BOOL) isNumeric
{
	//-- Validate Input: Check not Null --//
	if (!self) {
		return NO;
	}
	
	NSRange notFound = NSMakeRange(NSNotFound, 0);
	NSString *selfText = self;
	BOOL isNumeric = NO;
	
	//NSCharacterSet *invertedSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
	NSCharacterSet *invertedSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
	
	NSRange range = [selfText rangeOfCharacterFromSet:invertedSet];
	
	if (NSEqualRanges(range, notFound)) {
		isNumeric = YES;
	} else {
		isNumeric = NO;
	}
	
	return isNumeric;
}

/*--------------------------------------------------------------------------------------------------------------------------*/
/* Strips all HTML Tags of a given HTML String and returns its actual content only                                          */
/*--------------------------------------------------------------------------------------------------------------------------*/
- (NSString *)flattenHTML
{
	NSScanner *theScanner;
	NSString *content;
	NSString *selfText = self;
	
	theScanner = [NSScanner scannerWithString:selfText];
	
	while ([theScanner isAtEnd] == NO) {
		[theScanner scanUpToString:@"<" intoString:NULL];
		
		[theScanner scanUpToString:@">" intoString:&content];
		
		selfText = [selfText stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", content] withString:@""];
	}
	
	return selfText;
}

/*--------------------------------------------------------------------------------------------------------------------------*/
/* Returns the number of occurrences of a given substring with specified case sensitivity                                   */
/*--------------------------------------------------------------------------------------------------------------------------*/
- (NSInteger)countOccurrencesOfSubstring:(NSString *)substring caseSensitive:(BOOL)isCaseSensitive
{
	//-- Validate Input: Check not Null --//
	if (!self || !substring) {
		return 0;
	}
	
	//-- Validate Input: Check not empty --//
	if ([self isEqualToString:@""] || [substring isEqualToString:@""]) {
		return 0;
	}
	
	//-- Initialise Variables --//
	NSString *selfText = nil;
	NSRange notFound = NSMakeRange(NSNotFound, 0);
	NSInteger count = 0;
	
	//-- Check case sensitivity --//
	if (isCaseSensitive) {
		selfText = self;
	} else {
		selfText = [self lowercaseString];
		substring = [substring lowercaseString];
	}
	
	NSRange range = NSMakeRange(0, [selfText length]);
	
	while (range.location != NSNotFound) {
		range = [selfText rangeOfString:substring];
		
		if (!NSEqualRanges(range, notFound)) {
			count++;
			selfText = [selfText substringFromIndex:(range.location + range.length)];
		}
	}
	
	return count;
}

@end
