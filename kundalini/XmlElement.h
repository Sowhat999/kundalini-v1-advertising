//
//  XmlElement.h
//  kundalini
//
//  Created by Christian Andersen on 12/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLElement : NSObject
{
    NSString *name;
    NSString *text;
    NSDictionary *attributes;
    NSMutableArray *subElements;
    __weak XMLElement *parent;

}
@property (nonatomic,strong) NSString *name;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong ) NSDictionary *attributes;
@property (nonatomic, strong) NSMutableArray *subElements;
@property (nonatomic, weak) XMLElement *parent;
@end
