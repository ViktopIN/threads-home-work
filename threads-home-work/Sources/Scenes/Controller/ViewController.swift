//
//  ViewController.swift
//  threads-home-work
//
//  Created by t h a . m a m e rozz on 23.07.22.
//

import UIKit

class ViewController: UIViewController {
//  MARK: - Properties
    var isBlack: Bool = false {
        didSet {
            if isBlack {
                self.view.backgroundColor = .black
            } else {
                self.view.backgroundColor = .white
            }
        }
    }
//  MARK: - Methods
    @IBAction func onBut(_ sender: UIButton) {
        isBlack.toggle()
    }
    
    func bruteForce(passwordToUnlock: String) {
        let ALLOWED_CHARACTERS:   [String] = String().printable.map { String($0) }

        var password: String = ""

        // Will strangely ends at 0000 instead of ~~~
        while password != passwordToUnlock { // Increase MAXIMUM_PASSWORD_SIZE value for more
            password = generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
//             Your stuff here
            print(password)
            // Your stuff here
        }
        
        print(password)
    }
//  MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

