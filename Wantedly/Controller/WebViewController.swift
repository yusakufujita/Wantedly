//
//  WebViewController.swift
//  Wantedly
//
//  Created by 藤田優作 on 2021/03/05.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    private let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // webViewの大きさを画面全体にして表示
            webView.frame = view.frame
            view.addSubview(webView)

        // URLを指定してロードする
            let url = URL(string: "https://www.google.com")
            let request = URLRequest(url: url!)
            webView.load(request)
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
