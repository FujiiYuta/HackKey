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
    @IBOutlet weak var countLabel: UILabel!
    var array : [Int] = []
    var csvLines = [String]()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.text = "????"
        countLabel.text = "0000"
//        for i in 0 ... 9999{
//            array.append(i)
//            array.shuffle()
//        }
        guard let path = Bundle.main.path(forResource: "key", ofType: "csv") else{
            print("CSV file is not found")
            return
        }
        do{
            let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let lineChange = csvString.replacingOccurrences(of: "\r\n", with: "\n")
            csvLines = lineChange.components(separatedBy: .newlines)
            csvLines.removeLast()
        } catch let error as NSError{
            print("error: \(error)")
            return
        }
        
        for line in csvLines{
            array.append(Int(line)!)
        }
        array.shuffle()
    }
    
    @IBAction func tapButton(_ sender: Any) {
        if(counter > 9999){
            counter = 9999
            myLabel.text = "finish"
        }else{
            var randomString : String
//            let randomInt = array[counter]
//            配列の数を変えることになったからcountを配列のポインタとして使う必要はなくなった
            let randomInt = array[0]
            array.remove(at: 0)
            
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
            if(counter < 10){
                countLabel.text = "000" + String(counter)
            }else if(counter < 100){
                countLabel.text = "00" + String(counter)
            }else if(counter < 1000){
                countLabel.text = "0" + String(counter)
            }else{
                countLabel.text = String(counter)
            }
        }
    }
}

