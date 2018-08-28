//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Macbook on 10/18/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var SnailButton: UIButton!
    @IBOutlet weak var RabbitButton: UIButton!
    @IBOutlet weak var ChipmunkButton: UIButton!
    @IBOutlet weak var DarthVaderButton: UIButton!
    @IBOutlet weak var ReverbButton: UIButton!
    @IBOutlet weak var ParrotButton: UIButton!
    @IBOutlet weak var StopPlaybackButton: UIButton!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int{ case Slow = 0, Fast, Chipmunk, Vader, Reverb, Echo}
    
    @IBAction func stopPlaybackButtonPressed(sender: AnyObject){
        stopAudio()
    }
    @IBAction func playSoundButton(sender: AnyObject) {
        switch(ButtonType(rawValue: sender.tag)!){
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(rate: 0.9, pitch: 600)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo:true)
        case .Reverb:
            playSound(reverb: true)
        }
        configureUI(playState: .Playing)
    }
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(playState: .NotPlaying)
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
