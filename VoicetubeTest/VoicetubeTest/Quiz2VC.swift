//
//  Quiz2VC.swift
//  VoicetubeTest
//
//  Created by Hill Lin on 2021/8/29.
//

import UIKit


class Quiz2VC: UIViewController {

    private var timer = Timer()
    
    @IBOutlet weak var mTimeLabel: UILabel!
    
    @IBOutlet weak var mTimeTextField: UITextField!
    
    private var setupTime:Int?
    private var currentTime:Int = 0

    @IBOutlet weak var mStartTimeButton: UIButton!
    @IBAction func startTimeClick(_ sender: UIButton) {
        
        guard let text = mTimeTextField.text else {
            print("mTimeTextField.text error")
            return
        }
        
        setupTime = Int(text)
        
        guard let setupTime = setupTime else {
            print("set time plz")
            return
        }
        currentTime = setupTime

        startTimer(second: setupTime)
    }
    
    private func startTimer(second:Int) {
        
        view.endEditing(true)
        mTimeTextField.text = ""
        mStartTimeButton.isHidden = true
        mTimeLabel.text = "\(self.currentTime)"
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] timer in
            
            guard let self = self else { return }
            
            self.currentTime = self.currentTime - 1
            
            self.mTimeLabel.text = "\(self.currentTime)"
            
            if self.currentTime <= 0 {
                timer.invalidate()
                self.mStartTimeButton.isHidden = false
                self.mTimeLabel.text = "count down over"
            }
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer.invalidate()
    }

    

}
