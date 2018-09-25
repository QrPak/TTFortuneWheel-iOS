//
//  ViewController.swift
//  TTFortuneWheelSample
//
//  Created by Efraim Budusan on 10/31/17.
//  Copyright © 2017 Tapptitude. All rights reserved.
//

import UIKit
import FBAudienceNetwork
import TTFortuneWheel



class ViewController: UIViewController,FBAdViewDelegate {
    var bannerAdView:FBAdView!
    
    @IBOutlet weak var spinningWheel: TTFortuneWheel!
    override func viewDidLoad() {
        loadFacebookbanner()
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
    
    func loadFacebookbanner() {
    
        bannerAdView = FBAdView(placementID:"167275574191325_167282577523958"

, adSize: kFBAdSizeHeight50Banner, rootViewController: self)
        
        bannerAdView.frame = CGRect(x: 0, y: view.bounds.height - bannerAdView.frame.size.height, width: bannerAdView.frame.size.width, height: bannerAdView.frame.size.height)
        bannerAdView.delegate = self
        bannerAdView.isHidden = true
        self.view.addSubview(bannerAdView)
        bannerAdView.loadAd()
    }
    
    func adViewDidLoad(_ adView: FBAdView) {
        bannerAdView.isHidden = false
    }
    
    func adView(_ adView: FBAdView, didFailWithError error: Error) {
        print(error)
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

