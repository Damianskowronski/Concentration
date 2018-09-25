//
//  ViewController.swift
//  Concentration
//
//  Created by Damian Skowroński on 14.09.2018.
//  Copyright © 2018 Damian Skowroński. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //doczytać o LAZY ???
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2 )
    
    // MARK: Properties
    //@IBOutlet weak var cardButton: UIButton!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var flipCardCount = 0 {
        // observer - obserwuje wartosc i wykonuje poniższy kod po każdej zmianie wartości
        didSet {
            flipCountLabel.text = "Flip count: \(flipCardCount)"
        }
    }
    
    
    // MARK: Actions
    @IBAction func touchCard(_ sender: UIButton) {
        flipCardCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            print("index karty: \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("nie ma takiej karty")
        }
    }
    
    // MARK: Functions
    /* funkcja aktualizująca widok o zmiany w modelu*/
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            
            let card = game.cards[index]
            
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["💩","😡","💀","🤡","👻","👽","🤖","👺","👌🏻"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform((UInt32(emojiChoices.count))))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        /*
         if emoji[card.identifier] != nil {
         return emoji[card.identifier]
         } else {
         return "?"
         }
         */
        // powyższy kod można zamienić tak:
        
        return emoji[card.identifier] ?? "?"
    }
    
}

