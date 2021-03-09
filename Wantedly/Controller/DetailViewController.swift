//
//  WebViewController.swift
//  Wantedly
//
//  Created by 藤田優作 on 2021/03/05.
//

import UIKit
import Nuke

class DetailViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var maintitleLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var founder: UILabel!
    @IBOutlet weak var founderText: UILabel!
    @IBOutlet weak var applyButton: UIButton!
    
    
    var ImageView: String!
    var mainTitle:String!
    var subTitle:String!
    var logoimage:String!
    var company:String!
    var Text:String!
    var Founder:String!
    var FounderText:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyButton.layer.cornerRadius = 20
        
        Nuke.loadImage(with: URL(string: ImageView)!, into: imageView)
        Nuke.loadImage(with: URL(string: logoimage)!, into: logoImage)
        maintitleLabel.text = mainTitle
        subtitleLabel.text = subTitle
        companyLabel.text = company
        text.text = Text
        founder.text = Founder
        founderText.text = FounderText
    }
    
    
    @IBAction func applyButton(_ sender: Any) {
        
        let contentVC = PopoverViewController()
        // スタイルの指定
        contentVC.modalPresentationStyle = .popover
        contentVC.view.backgroundColor = .orange
        // サイズの指定
        contentVC.preferredContentSize = CGSize(width: 400, height: 400)
        // 表示するViewの指定
        contentVC.popoverPresentationController?.sourceView = view
        // ピヨッと表示する位置の指定
        contentVC.popoverPresentationController?.sourceRect = (sender as AnyObject).frame
        // 矢印が出る方向の指定
        contentVC.popoverPresentationController?.permittedArrowDirections = .unknown
        contentVC.popoverPresentationController?.permittedArrowDirections.isEmpty
        // デリゲートの設定
        contentVC.popoverPresentationController?.delegate = self
        //表示
        present(contentVC, animated: true, completion: nil)
        
    }
    
    // iPhoneで表示させる場合に必要
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
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
