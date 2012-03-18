//
//  Possession.m
//  RandomPossessions
//
//  Created by Tosin Onafowokan on 1/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Possession.h"

@implementation Possession

- (id)initWithPossessionName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber{
    
    //calls the superclass's designated initializer
    self = [super init];
    
    //did the superclass's designated initiatizer succeed?
    if(self){
        
        //give the instance variables initial values
        [self setPossessionName:name];
        [self setValueInDollars:value];
        [self setSerialNumber:sNumber];
    
        dateCreated = [[NSDate alloc] init];
    }
    
    //return the address of the newly initialized object
    return self;
}

+ (id)randomPossession{
    
    //create an array of 3 adjectives
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
    
    //create an array of 3 nouns
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];
    
    //get the index of a random adjective/noun from the lists
    //note: The % operator, called the modulo operator, gives
    //you the remainder. So adjectiveIndex is a random number
    //from 0 to 2 inclusive.
    int adjectiveIndex = (int)(rand() % [randomAdjectiveList count]);
    int nounIndex = (int)(rand() % [randomNounList count]);
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", [randomAdjectiveList objectAtIndex:adjectiveIndex], [randomNounList objectAtIndex:nounIndex]];
    
    int randomValue = rand() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + rand() % 10, 'A' + rand() % 26, '0' + rand() % 10, 'A' + rand() % 26, '0' + rand() % 10];
    
    //once again, ignore the memory problems with this method
    Possession *newPossession = [[self alloc] initWithPossessionName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newPossession;
}

- (id)init{
    
    return [self initWithPossessionName:@"" valueInDollars:0 serialNumber:@""];
}

@synthesize possessionName;
@synthesize serialNumber;
@synthesize valueInDollars;
@synthesize dateCreated;
/*
- (void)setPossessionName:(NSString *)str{
    possessionName = str;
}

- (NSString *)possessionName{
    return possessionName;
}

- (void)setSerialNumber:(NSString *)str{
    serialNumber = str;
}

- (NSString *)serialNumber{
    return serialNumber;
}

- (void)setValueInDollars:(int)i{
    valueInDollars = i;
}

- (int)valueInDollars{
    return valueInDollars;
}

- (NSDate *)dateCreated{
    return dateCreated;
}
*/
- (NSString *)description{
    
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", possessionName, serialNumber, valueInDollars, dateCreated];
    
    return descriptionString;
}

@end
