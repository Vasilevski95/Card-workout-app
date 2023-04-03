//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by George Vasilevski on 01/04/2023.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    //Gives you access to this object code
    //The reason you need access is to make changes
    
    
    var cards: [UIImage] = Deck.allValues
    
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
}
