//
//  PlaySoundsViewControlloerViewController.swift
//  Pitch Perfect
//
//  Created by Wellington Bengtson on 23/04/15.
//  Copyright (c) 2015 Wellington Bengtson. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var avAudioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioEngine = AVAudioEngine()
        avAudioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        avAudioPlayer.enableRate = true
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playSlowly(sender: UIButton) {
        playSound(0.5)
    }
    
    @IBAction func playFast(sender: UIButton) {
        playSound(2)
    }

    
    func playSound(rate: Float) {
        avAudioPlayer.stop()
        audioEngine.stop()
        avAudioPlayer.rate = rate
        avAudioPlayer.play()
    }
    
    @IBAction func playChipMunkAudio(sender: UIButton) {
        playSoundWithPitch(1000)
    }
    
    @IBAction func playDarthVader(sender: UIButton) {
        playSoundWithPitch(-2000)
    }
    
    func playSoundWithPitch(pitch:Float) {
        avAudioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        var timePitch = AVAudioUnitTimePitch()
        
        timePitch.pitch = pitch
        audioEngine.attachNode(audioPlayerNode)
        audioEngine.attachNode(timePitch)
        
        audioEngine.connect(audioPlayerNode, to: timePitch, format: nil)
        audioEngine.connect(timePitch, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
    }
    

    @IBAction func stopSound(sender: UIButton) {
        avAudioPlayer.currentTime = 0
        avAudioPlayer.stop()
        audioEngine.stop()
    }
}
