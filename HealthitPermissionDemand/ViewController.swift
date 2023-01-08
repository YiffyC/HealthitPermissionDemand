//
//  ViewController.swift
//  HealthitPermissionDemand
//
//  Created by Bérenger on 08/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var authorizedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        authorizedButton.addTarget(self, action: #selector(openPermissionSetup), for: .touchUpInside)
        authorizedButton.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
    }

    @objc func openPermissionSetup(){
        
        PermissionHealthKitSetup.AuthorizeHealthKitSetup { authorized, error in
            guard authorized else {
                let message = "authorized : fail"
                if let error = error {
                    print("\(message) reason \(error) ")
                }
                return
            }
            print("Healthit authorized")
        }
    }
    

}

