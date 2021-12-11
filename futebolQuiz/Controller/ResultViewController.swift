//
//  ResultViewController.swift
//  futebolQuiz
//
//  Created by Bruno Lopes on 11/12/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    var score: Int?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = ("Você fez \(score ?? 0) gols!")
        
        if score ?? 0 < 5 {
            adviceLabel.text = "Melhore a pontaria"
        } else if score ?? 0 < 8 {
            adviceLabel.text = "Boa pontaria"
        } else {
            adviceLabel.text = "Excelente pontaria"
        }
    }
    
    @IBAction func tryAgainButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
