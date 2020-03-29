//
//  ViewController.swift
//  HackKey
//
//  Created by 藤井悠太 on 2020/02/15.
//  Copyright © 2020 yutahand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    var array : [Int] = []
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "????"
        for i in 0 ... 9999{
            array.append(i)
            array.shuffle()
        }
        
    }
    
    @IBAction func tapButton(_ sender: Any) {
        if(counter > 9999){
            counter = 9999
            myLabel.text = "finish"
        }else{
            var randomString : String
            let randomInt = array[counter]
            if(randomInt < 10){
                randomString = "000" + String(randomInt)
            }else if(randomInt < 100){
                randomString = "00" + String(randomInt)
            }else if(randomInt < 1000){
                randomString = "0" + String(randomInt)
            }else{
                randomString = String(randomInt)
            }
            myLabel.text = randomString
            counter += 1
        }
    }
}

