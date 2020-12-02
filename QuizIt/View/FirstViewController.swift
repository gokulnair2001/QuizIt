//
//  FirstViewController.swift
//  QuizIt
//
//  Created by Gokul Nair on 02/12/20.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startBtn.layer.cornerRadius = 10
    }
    

    @IBAction func startTestBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "start", sender: nil)
    }

}
