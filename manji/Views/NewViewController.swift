//
//  NewViewController.swift
//  manji
//
//  Created by 池田俊輝 on 2018/05/12.
//  Copyright © 2018年 会津慎弥. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    
    let imageBag = UIImageView()

    
    var imy = 128
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    // Screen Size の取得
    let screenWidth:CGFloat = view.frame.size.width
    let screenHeight:CGFloat = view.frame.size.height
    // ハンドバッグの画像を設定
    imageBag.image = UIImage(named: "img_07.png")
    // 画像のフレームを設定
    imageBag.frame = CGRect(x:0, y:0, width:128, height:imy)
    
    // 画像をスクリーン中央に設定
    imageBag.center = CGPoint(x:screenWidth/2, y:600)
    
    // タッチ操作を enable
    imageBag.isUserInteractionEnabled = true
    
    self.view.addSubview(imageBag)
    

    // 画面背景を設定
    self.view.backgroundColor = UIColor(red:0.85,green:1.0,blue:0.95,alpha:1.0)
        
    // Do any additional setup after loading the view.
    }
    
    // 画面にタッチで呼ばれる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        
    }
    
    //　ドラッグ時に呼ばれる
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // タッチイベントを取得
        let touchEvent = touches.first!
        
        // ドラッグ前の座標, Swift 1.2 から
        let preDy = touchEvent.previousLocation(in: self.view).y
        
        // ドラッグ後の座標
        var newDy = touchEvent.location(in: self.view).y
        
        
        // ドラッグしたy座標の移動距離
        let dy = newDy - preDy
        
        // 画像のフレーム
        var viewFrame: CGRect = imageBag.frame
        
        // 移動分を反映させる
        viewFrame.origin.y += dy
        
        imageBag.frame = viewFrame
        
        self.view.addSubview(imageBag)
        
        if(newDy<300){
            imageBag.frame = CGRect(x:0, y:100000, width:128, height:imy)
        }
        print(newDy)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func back(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "home")
        //ここが実際に移動するコードとなります
        self.present(second, animated: true, completion: nil)
    }
    
    @IBAction func detail(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "detail")
        //ここが実際に移動するコードとなります
        self.present(second, animated: true, completion: nil)
    }
    
    
}
