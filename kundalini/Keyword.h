//
//  Keyword.h
//  kundalini
//
//  Created by Christian Andersen on 28/09/12.
//
//

#import <Foundation/Foundation.h>

@interface Keyword : NSObject
{
    NSString *Key;
    NSString *Link;
}

@property (nonatomic, strong) NSString *Key;
@property (nonatomic,strong ) NSString *Link;

@end
