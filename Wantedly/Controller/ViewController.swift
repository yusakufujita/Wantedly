//
//  ViewController.swift
//  Wantedly
//
//  Created by 藤田優作 on 2021/03/05.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    
    private var articles:[Data] = []
    private var searchResult = [Data]()
    private var masterData = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Wantedly"
        
        searchbar.delegate = self
        searchbar.enablesReturnKeyAutomatically = false
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        
        // Do any additional setup after loading the view.
//        loadArticles()
//        let urlString = "https://www.wantedly.com/api/v1/projects?q=swift&page=1"
//        let request = AF.request(urlString)
//
//        request.responseJSON{(response) in
//            print("response:", response)
//        }
        
    }
    // loadする関数の定義
    private func fetch() {
        let urlString = "https://www.wantedly.com/api/v1/projects?q=swift&page=1"
        let request = AF.request(urlString)
        request.responseJSON { (response) in
            do{
                //            print("response:",response)
                //取得したデータを変換
                guard let data = response.data else {return}
                print(data)
                let decoder = JSONDecoder()
                let article = try decoder.decode(Article.self, from: data)
                self.articles = article.data
                self.masterData = article.data
                self.tableView.reloadData()
                print("article:",self.articles.count)
            }catch {
                print("変換に失敗しました:",error)
            }
            
            //            let article = try decode.decode(Article.self, from: data)
            //                print("article:",article.title)
            //            } catch {
            //                print("変換に失敗しました:",error)
            //            }
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let article = articles[indexPath.row]
        cell.set(title: article.title, author: article.looking_for,imageUrl: article.looking_for, looking_for: article.looking_for)
        return cell
    }
}


extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let webViewController = storyboard.instantiateInitialViewController() as! DetailViewController
        // ③indexPathを使用してarticlesから選択されたarticleを取得
        let article = articles[indexPath.row]
        // ④urlとtitleを代入
        webViewController.url = article.looking_for
        webViewController.title = article.title
        navigationController?.pushViewController(webViewController, animated: true)
    }
    
    
    
}

