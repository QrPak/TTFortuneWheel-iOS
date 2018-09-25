//
//  ViewController.swift
//  TTFortuneWheelSample
//
//  Created by Efraim Budusan on 10/31/17.
//  Copyright © 2017 Tapptitude. All rights reserved.
//

import UIKit
import TTFortuneWheel

class ViewController: UIViewController {

    @IBOutlet weak var spinningWheel: TTFortuneWheel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let slices = [ CarnivalWheelSlice.init(title: "掃地"),
                       CarnivalWheelSlice.init(title: "倒垃圾"),
                       CarnivalWheelSlice.init(title: "擦地板"),
                       CarnivalWheelSlice.init(title: "做飯"),
                       CarnivalWheelSlice.init(title: "洗碗"),
                       CarnivalWheelSlice.init(title: "澆花"),
                       CarnivalWheelSlice.init(title: "洗馬桶"),
                       CarnivalWheelSlice.init(title: "再轉一次")]
        spinningWheel.slices = slices
        spinningWheel.equalSlices = true
        spinningWheel.frameStroke.width = 0
        spinningWheel.slices.enumerated().forEach { (pair) in
            let slice = pair.element as! CarnivalWheelSlice
            let offset = pair.offset
            switch offset % 4 {
            case 0: slice.style = .brickRed
            case 1: slice.style = .sandYellow
            case 2: slice.style = .babyBlue
            case 3: slice.style = .deepBlue
            default: slice.style = .brickRed
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rotateButton(_ sender: Any) {

        spinningWheel.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
         
            self.spinningWheel.startAnimating(fininshIndex: 6) { (finished) in
                print("finished")
            }
        }
    }
}

