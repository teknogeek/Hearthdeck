//
//  Deck.h
//  Hearthdeck
//
//  Created by Michael Margolis on 12/21/13.
//  Copyright (c) 2013 Joel Margolis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Deck : NSObject

@property (nonatomic,strong) NSString *deckName;

- (id)initWithName:(NSString *)deckName;

@end
