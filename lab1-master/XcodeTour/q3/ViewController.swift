//
//  ViewController.swift
//  XcodeTour
//
//  Created by Franklin Ye on 9/12/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var texterino: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.texterino.text = "i am a view controller with a class set 😊"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
