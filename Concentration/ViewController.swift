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
    
    var flipCardCount = 0 {
        // observer - obserwuje wartosc i wykonuje poniższy kod po każdej zmianie wartości
        didSet {
            flipCountLabel.text = "Flip count: \(flipCardCount)"
        }
    }
    
    
    // MARK: Actions
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(with_emoji: "😡", on: sender)
        flipCardCount += 1
    }
    
    // MARK: Functions
    
    func flipCard(with_emoji emoji: String, on button: UIButton) {
        print("flipCardWithEmoji: \(emoji)")
        if button.currentTitle == emoji {
            cardButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            cardButton.setTitle("", for: UIControlState.normal)
        } else {
            cardButton.setTitle(emoji, for: UIControlState.normal)
            cardButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

    
}

