//
//  DetailViewController.swift
//  manji
//
//  Created by 池田俊輝 on 2018/05/12.
//  Copyright © 2018年 会津慎弥. All rights reserved.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var diary: [Diary]?
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var backbutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDiary()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getDiary() {
        let api = Api.getDiary()
        let request: Observable<[Diary]> = ApiClient.get(api: api, headers: nil)
        request.subscribe(
            onNext: { (diary) in
                self.diary = diary
                self.loadView()
        },
            onError: { (error) in
                print(error)
        })
            .disposed(by: disposeBag)
    }
    
    @IBAction func back(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "home")
        //ここが実際に移動するコードとなります
        self.present(second, animated: true, completion: nil)
    }
    
    @IBAction func now_go(_ sender: Any) {
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "now")
        //ここが実際に移動するコードとなります
        self.present(second, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = 0
        if diary != nil {
            return self.diary!.count
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath)
        
        // セルに表示する値を設定する
        tableView.rowHeight = 200
        cell.imageView?.image = diary![indexPath.row].getThumbImg()
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.textLabel!.text = diary![indexPath.row].date
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.detailTextLabel?.text = "室温"+diary![indexPath.row].temperature+"度"
        
        
        return cell
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
