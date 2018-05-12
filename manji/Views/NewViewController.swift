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
    var labelX = 0
    var labelY = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
