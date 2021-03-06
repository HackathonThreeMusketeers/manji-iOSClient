//
//  ViewController.swift
//  manji
//
//  Created by 会津慎弥 on 2018/05/12.
//  Copyright © 2018年 会津慎弥. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image11 = UIImage(named: "img_02.png")
        let image22 = UIImage(named: "img_01.png")
        
        image1.image = image11
        image2.image = image22
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func detail(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "detail")
        //ここが実際に移動するコードとなります
        self.present(second, animated: true, completion: nil)
    }
    
    @IBAction func now(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "now")
        //ここが実際に移動するコードとなります
        self.present(second, animated: true, completion: nil)
    }
    
    
}

