//
//  XmlElement.m
//  kundalini
//
//  Created by Christian Andersen on 12/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XmlElement.h"

@implementation XMLElement

@synthesize name;
@synthesize text;
@synthesize attributes;
@synthesize subElements;
@synthesize parent;

-(NSMutableArray *) subElements{
    if (subElements == nil){
        subElements = [[NSMutableArray alloc] init];
    }
    return subElements;
}

@end
