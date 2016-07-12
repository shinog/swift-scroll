//
//  NewViewController.swift
//  UICollectionView Xcode 7
//
//  Created by PJ Vea on 7/1/15.
//  Copyright © 2015 Vea Software. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class NewViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage()
    
    var playerViewController: AVPlayerViewController!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.imageView.image = self.image
        
        // 動画ファイルのURLを取得
        
        let url = NSURL(string: "https://video.kurashiru.com/production/videos/1cd2992a-d133-4ead-9960-8dc82027f51a/original.mp4");
        
        // アイテム取得
        let playerItem = AVPlayerItem(URL: url!)
        
        // 生成
        let player = AVPlayer(playerItem: playerItem)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        // 設定
        playerViewController.view.frame = CGRectMake(54, 96, view.bounds.width - 108, view.bounds.height - 400)
        playerViewController.showsPlaybackControls = true // 操作パネルを非表示にする場合はfalse
        playerViewController.videoGravity = AVLayerVideoGravityResize // 矩形にフィット
        
        // 通知登録
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didPlayerItemReachEnd:", name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
        
        // 表示
        view.addSubview(playerViewController.view)
        
        // 再生
        player.play()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
