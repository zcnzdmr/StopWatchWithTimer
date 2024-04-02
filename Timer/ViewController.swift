//
//  ViewController.swift
//  Timer
//
//  Created by Özcan Özdemir on 2.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel = UILabel()
    var myButton1 = UIButton()
    var myButton2 = UIButton()
    var myButton3 = UIButton()
    var myButton4 = UIButton()
    var timer = Timer()
    var counter = 100
    
    var startNesnesi = true
    var pauseNesnesi = true
    var resumeNesnesi = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = UIScreen.main.bounds.width
        
        //Label kısmı
        myLabel.frame = CGRect(x: (screenWidth - 350 ) * 0.5, y: 180, width: 350, height: 40)
        myLabel.textAlignment = .center
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.text = "Press Start button to execute"
        view.addSubview(myLabel)
        
        //button1
        myButton1.frame = CGRect(x: (screenWidth - 90 ) / 2, y: 280, width: 90, height: 30)
        myButton1.setTitle("Start", for: UIControl.State.normal)
        myButton1.setTitleColor(.blue, for: UIControl.State.normal)
        view.addSubview(myButton1)
        
        myButton1.addTarget(self, action: #selector(start), for: .touchUpInside)
        
        //buton2
        myButton2.frame = CGRect(x: (screenWidth - 90 ) / 2, y: 340, width: 90, height: 30)
        myButton2.setTitle("Pause", for: UIControl.State.normal)
        myButton2.setTitleColor(.blue, for: UIControl.State.normal)
        view.addSubview(myButton2)
        myButton2.addTarget(self, action: #selector(pause), for: .touchUpInside)
        
        //buton3
        myButton3.frame = CGRect(x: (screenWidth - 90 ) / 2, y: 400, width: 90, height: 30)
        myButton3.setTitle("Restart", for: UIControl.State.normal)
        myButton3.setTitleColor(.blue, for: UIControl.State.normal)
        view.addSubview(myButton3)
        myButton3.addTarget(self, action: #selector(restart), for: .touchUpInside)
        
        //button4
        myButton4.frame = CGRect(x: (screenWidth - 90 ) / 2, y: 460, width: 90, height: 30)
        myButton4.setTitle("Resume", for: UIControl.State.normal)
        myButton4.setTitleColor(.blue, for: UIControl.State.normal)
        view.addSubview(myButton4)
        myButton4.addTarget(self, action: #selector(resume), for: .touchUpInside)
        
    }
    @objc func countDown() {
        counter-=1
        myLabel.text = String(counter)
        
        if counter < 0 {
            timer.invalidate()
            myLabel.text = "Time is over"
            counter = 100
        }
        
    }
    
    func timerFonk() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @objc func start() {
        
        if startNesnesi == true {
            startNesnesi = false
            timerFonk()
            resumeNesnesi = true
        }
    }
    
    @objc func pause() {
        
        if pauseNesnesi == true && counter != 100 {
            timer.invalidate()
            pauseNesnesi = false
            resumeNesnesi = true
            
        }
    }
    
    @objc func resume() {
        
        if resumeNesnesi == true {
            timerFonk()
            pauseNesnesi = true
            resumeNesnesi = false
        }
    }
    
    @objc func restart() {
        timer.invalidate()
        counter = 100
        myLabel.text = "Press Start button"
        startNesnesi = true
        pauseNesnesi = true
    }
}

