//
//  GameView.swift
//  nova
//
//  Created by Ds on 14-10-14.
//  Copyright (c) 2014年 motorcycle. All rights reserved.
//

import UIKit
import AVFoundation

class GameView: UIView {
    
    var audioPlayer:AVAudioPlayer?
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override drawRect(rect: CGRect)
    {
        // Drawing code
        super.drawRect(rect)
    }
    */
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        // init
        let key = "girl"
        var urls = ["man", "woman", "boy", "girl"]
        
        // sound
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource(key, ofType:"mp3")!)
        audioPlayer = AVAudioPlayer(contentsOfURL:url, error:nil)
        let soundBtn = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        soundBtn.setTitle("Sound", forState: UIControlState.Normal)
        soundBtn.backgroundColor = UIColor.blueColor()
        soundBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        soundBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        soundBtn.addTarget(self, action: "playSound", forControlEvents: .TouchUpInside)
        
        // image
        var imageBtns:[UIButton] = []
        for url in urls {
            let b = UIButton.buttonWithType(.Custom) as UIButton
            b.setBackgroundImage(UIImage(named: url + ".jpg"), forState: UIControlState.Normal)
            if url == key {
                b.setTitle("Right", forState: .Highlighted)
                b.setTitleColor(UIColor.greenColor(), forState: .Highlighted)
            } else {
//                b.setTitle("Wrong", forState: .Highlighted)
//                b.setTitleColor(UIColor.redColor(), forState: .Highlighted)
                b.setImage(UIImage(named: "girl.jpg"), forState: UIControlState.Highlighted)
            }
            imageBtns.append(b)
        }
        
        // layout
        let corner:CGFloat = 3
        let vBorder:CGFloat = 1
        let vWidth = self.frame.width/2-vBorder*2
        let vSize = CGSizeMake(vWidth, vWidth/2*3)
        let vTop = (self.frame.height - (vSize.height + vBorder*2)*2)/2
        for var index = 0; index < imageBtns.count; index++ {
            let xIndex:CGFloat = (CGFloat)(index%2)
            let yIndex:CGFloat = (CGFloat)(index/2)
            let b = imageBtns[index]
            
            b.frame = CGRectMake(xIndex * vSize.width + (xIndex*2 + 1) * vBorder, yIndex * vSize.height + (yIndex*2 + 1) * vBorder + vTop, vSize.width, vSize.height)
            b.contentMode = UIViewContentMode.ScaleAspectFit
            b.layer.cornerRadius = corner
            b.clipsToBounds = true
            self.addSubview(b)
        }
        
        // sound button
        soundBtn.frame = CGRectMake(vBorder, self.frame.height - vTop + vBorder, self.frame.width - vBorder*2, vTop - vBorder*2)
        soundBtn.layer.cornerRadius = corner
        soundBtn.clipsToBounds = true
        self.addSubview(soundBtn)
        
        // audio
//        playSound()
    }
    
    
    func playSound() {
//        audioPlayer!.play()
        println("test")
    }
    
}
