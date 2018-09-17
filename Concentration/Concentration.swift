//
//  Concentration.swift
//  Concentration
//
//  Created by Damian Skowroński on 17.09.2018.
//  Copyright © 2018 Damian Skowroński. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1..<numberOfPairsOfCards {
            let card = Card()
            /*
            let matchingCard = card
            cards.append(matchingCard)
             card jest strukturą wiec dodanie jej do tablicy powoduje jej powielenie,
             nie trzeba więc tworzyć jej kopii, można dwa razy dodać tę samą kartę
            */
            /* zamiast poniższego zapisu można użyć */
//            cards.append(card)
//            cards.append(card)
            //tego
            cards += [card, card]
        }
    }
    
    // TODO: shuffle the cards
}
