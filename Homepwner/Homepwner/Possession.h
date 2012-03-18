//
//  Possession.h
//  RandomPossessions
//
//  Created by Tosin Onafowokan on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSObject{
    
    NSString *possessionName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
}

+ (id)randomPossession;

- (id)initWithPossessionName: (NSString *)name 
              valueInDollars: (int)value 
                serialNumber: (NSString *)sNumber;

@property (nonatomic, copy) NSString *possessionName;
@property (nonatomic, copy) NSString *serialNumber;

@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;

/*
- (void)setPossessionName:(NSString *)str;
- (NSString *)possessionName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)i;
- (int)valueInDollars;

- (NSDate *)dateCreated;
 */

@end
