//
//  File.swift
//  Concentration
//
//  Created by Damian Skowroński on 17.09.2018.
//  Copyright © 2018 Damian Skowroński. All rights reserved.
//

import Foundation

struct Card
{
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    static var uniqIdentifier = 0
    
    static func getUniqIdentifier()-> Int {
//        Card.uniqIdentifier += 1
//        przedrostek Card. jest niepotrzebny ponieważ znajdujemy się wewnątrz
//        statycznej metody
        uniqIdentifier += 1
        return uniqIdentifier
    }
    
    init() {
        self.identifier = Card.getUniqIdentifier()
    }
}
