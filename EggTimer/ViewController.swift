//
//  ViewController.swift
//  EggTimer
//
//  Created by Brian Haucke on 04/21/2020.
//  Created with the Complete iOS App Developer Bootcamp
//  © 2019 The App Brewery
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    let eggTimes = ["Soft": 300, "Medium": 480, "Hard": 720]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        //print(sender.currentTitle)
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressView.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
        
//        if (hardness == "Soft") {
//            print(eggTimes["Soft"])
//        }
//        if (hardness == "Medium"){
//            print(eggTimes["Medium"])
//        }
//        if (hardness == "Hard"){
//            print(eggTimes["Hard"])
//        }
    }
    @objc func updateTimer(){
        if (secondsPassed < totalTime) {
            
            secondsPassed += 1
            progressView.progress = Float(secondsPassed)/Float(totalTime)
            print(Float(secondsPassed)/Float(totalTime))
            
                
            
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }

        
    }
    

    
    
}
