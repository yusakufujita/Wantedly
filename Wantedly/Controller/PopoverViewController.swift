//
//  PopoverViewController.swift
//  Sample
//
//  Created by 藤田優作 on 2021/03/07.
//

import UIKit

class PopoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel2 = UILabel()
        titleLabel2.frame = CGRect(x: -28, y: 50, width: UIScreen.main.bounds.size.width, height: 100) // 位置とサイズの指定
        titleLabel2.font = titleLabel2.font.withSize(1)
        titleLabel2.textAlignment = NSTextAlignment.center
        titleLabel2.text = """
            応募が完了しました。
        """
        titleLabel2.font = titleLabel2.font.withSize(20)
        titleLabel2.numberOfLines = 0
        titleLabel2.textColor = UIColor.white
        titleLabel2.font = UIFont(name: "HiraKakuProN-W6", size: 17)
        self.view.addSubview(titleLabel2)
        
        
        let titleLabel1 = UILabel()
        titleLabel1.frame = CGRect(x: -10, y: 160, width: UIScreen.main.bounds.size.width, height: 100)
        titleLabel1.font = titleLabel1.font.withSize(1)
        titleLabel1.textAlignment = NSTextAlignment.center
        titleLabel1.text = """
            応募いただき、ありがとうございます。
        """
        titleLabel1.numberOfLines = 0
        titleLabel1.textColor = UIColor.white
        titleLabel1.font = UIFont(name: "HiraKakuProN-W6", size: 17) 
        self.view.addSubview(titleLabel1) //
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
