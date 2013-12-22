//
//  Deck.m
//  Hearthdeck
//
//  Created by Michael Margolis on 12/21/13.
//  Copyright (c) 2013 Joel Margolis. All rights reserved.
//

#import "Deck.h"

@implementation Deck

- (id)initWithName:(NSString *)deckName
{
    self = [super init];
    
    if (self)
    {
        _deckName = deckName;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Deck Name: %@", _deckName];
}

@end
