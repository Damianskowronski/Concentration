//
//  ViewController.swift
//  Concentration
//
//  Created by Damian Skowroński on 14.09.2018.
//  Copyright © 2018 Damian Skowroński. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var cardButton: UIButton!
    @IBOutlet weak var flipCountLabel: UILabel!
    var emojiChoices: [String] = ["💩","👽","👽","💩"]
    
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
            print("numer karty = \(cardNumber)")
            flipCard(with_emoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("nie ma takiej karty")
        }
    }
    
    // MARK: Functions
    
    func flipCard(with_emoji emoji: String, on button: UIButton) {
        print("flipCardWithEmoji: \(emoji)")
        if button.currentTitle == emoji {
            button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            button.setTitle("", for: UIControlState.normal)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

    
}

