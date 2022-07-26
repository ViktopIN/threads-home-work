//
//  ViewController.swift
//  threads-home-work
//
//  Created by t h a . m a m e rozz on 23.07.22.
//

import UIKit

class ViewController: UIViewController {
//  MARK: - Properties
    private var mainView: View? {
        guard isViewLoaded else { return nil }
        return view as? View
    }
    
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
        
        mainView?.textField.isSecureTextEntry = true
        
        self.bruteForce(passwordToUnlock: "1!gr")
        
        // Do any additional setup after loading the view.
    }
}

//  MARK: - Extenions
extension String {
    mutating func replace(at index: Int, with character: Character) {
        var stringArray = Array(self)
        stringArray[index] = character
        self = String(stringArray)
    }
}

func indexOf(character: Character, _ array: [String]) -> Int {
    return array.firstIndex(of: String(character))!
}

func characterAt(index: Int, _ array: [String]) -> Character {
    return index < array.count ? Character(array[index])
                               : Character("")
}

func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
    var str: String = string

    if str.count <= 0 {
        str.append(characterAt(index: 0, array))
    }
    else {
        str.replace(at: str.count - 1,
                    with: characterAt(index: (indexOf(character: str.last!, array) + 1) % array.count, array))

        if indexOf(character: str.last!, array) == 0 {
            str = String(generateBruteForce(String(str.dropLast()), fromArray: array)) + String(str.last!)
        }
    }

    return str
}
