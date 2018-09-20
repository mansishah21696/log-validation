//
//  ViewController.swift
//  log
//
//  Created by TOPS on 7/16/18.
//  Copyright © 2018 dp. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var username = " "
    var password = " "
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var usename: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    
        
    
    @IBAction func resetpass(_ sender: Any) {
        let stb = self.storyboard?.instantiateViewController(withIdentifier: "reset")
        self.navigationController?.pushViewController(stb!, animated: true)
    }
    

    @IBAction func log(_ sender: Any) {
        //let u_name = usename.text;
        //let p_word = pass.text
        
        
        if username==usename.text && password==pass.text{
            let stb = self.storyboard?.instantiateViewController(withIdentifier: "dash")
        self.navigationController?.pushViewController(stb!, animated: true)
        }
        else{
            let alt = UIAlertController(title: "password is incorrect", message: "enter valid password", preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default, handler: {action in
            
            
            })
            alt.addAction(ok)
            self.present(alt, animated: true, completion: nil)
            }
    }
    
    
    @IBAction func signup(_ sender: Any) {
        let stb = self.storyboard?.instantiateViewController(withIdentifier: "register")
        self.navigationController?.pushViewController(stb!, animated: true)
    
    }
    
    
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

