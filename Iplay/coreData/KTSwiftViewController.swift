//
//  KTSwiftViewController.swift
//  Iplay
//
//  Created by 推凯 on 2017/2/22.
//  Copyright © 2017年 TK. All rights reserved.
//

import UIKit

class KTSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //在 pch文件中添加 OC文件名字,即可调用 OC类的方法
        let vc=CoreDataViewController()
        print(vc.str)
        // Do any additional setup after loading the view.
    }
    func test() -> String {
     return"Swift123"
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
