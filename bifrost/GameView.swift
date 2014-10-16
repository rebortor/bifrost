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

        // image
        var urls = ["man.jpg", "woman.jpg", "boy.jpg", "girl.jpg"]
        let corner:CGFloat = 3
        let vBorder:CGFloat = 1
        let vWidth = self.frame.width/2-vBorder*2
        let vSize = CGSizeMake(vWidth, vWidth/2*3)
        let vTop = (self.frame.height - (vSize.height + vBorder*2)*2)/2
        for var index = 0; index < urls.count; index++ {
            let xIndex:CGFloat = (CGFloat)(index%2)
            let yIndex:CGFloat = (CGFloat)(index/2)
//            let v = UIImageView(image: UIImage(named: urls[index]))
            let v = UIButton.buttonWithType(UIButtonType.System) as UIButton
            v.setBackgroundImage(UIImage(named: urls[index]), forState: UIControlState.Normal)
            v.setTitle("Right", forState: UIControlState.Normal)
            v.setTitleColor(UIColor.greenColor(), forState: .Normal)
            v.setTitleColor(UIColor.redColor(), forState: UIControlState.Selected)
            
            v.frame = CGRectMake(xIndex * vSize.width + (xIndex*2 + 1) * vBorder, yIndex * vSize.height + (yIndex*2 + 1) * vBorder + vTop, vSize.width, vSize.height)
            v.contentMode = UIViewContentMode.ScaleAspectFit
            v.layer.cornerRadius = corner
            v.clipsToBounds = true
            self.addSubview(v)
        }
        
        // sound button
        let bt = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        bt.setTitle("Sound", forState: UIControlState.Normal)
        bt.backgroundColor = UIColor.blueColor()
        bt.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        bt.setTitle("Sound", forState: UIControlState.Selected)
        bt.setTitleColor(UIColor.redColor(), forState: UIControlState.Selected)

        bt.frame = CGRectMake(vBorder, self.frame.height - vTop + vBorder, self.frame.width - vBorder*2, vTop - vBorder*2)
        bt.layer.cornerRadius = corner
        bt.clipsToBounds = true
        bt.addTarget(self, action: "playSound", forControlEvents: .TouchUpInside)
        self.addSubview(bt)
        
        // audio
        let url = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("girl", ofType:"mp3")!)
        audioPlayer = AVAudioPlayer(contentsOfURL:url, error:nil)
//        playSound()
    }
    
    
    func playSound() {
        audioPlayer!.play()
    }
    
}
