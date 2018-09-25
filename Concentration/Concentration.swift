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
    //MARK: Properties
    var cards = [Card]()
    var idexOfOneAndOnlyFaceUpCard: Int?
    

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = idexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                idexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
                idexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    // add button to reset the game
    
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
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
        print("Ilość kart: \(cards.count)")
    }
    
    // TODO: shuffle the cards
}
