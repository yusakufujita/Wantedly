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
    @IBOutlet weak var searchback: UIView!
    
    private var articles:[Data] = []
    private var searchResult = [Data]()
    private var masterData = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Wantedly"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 255, blue: 73, alpha: 1.0)
        
        searchback.backgroundColor = UIColor(red: 0, green: 255, blue: 73, alpha: 1.0)
        searchbar.backgroundColor = UIColor(red: 0, green: 255, blue: 73, alpha: 1.0)
        
        
        searchbar.delegate = self
        searchbar.enablesReturnKeyAutomatically = false
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        fetch()

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
        }
    }
    //テキスト変更時の呼び出しメソッド
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchbar.endEditing(true)
        //検索結果配列を空にする
        //        print(searchResult)
        if(searchbar.text == "") {
            //検索文字列が空の場合はすべてを表示する。
            articles = masterData
        }else {
            searchResult = masterData.filter{$0.looking_for.contains(searchbar.text!) || $0.title.contains(searchbar.text!) || $0.company.name.contains(searchbar.text!) || $0.description.contains(searchbar.text!)}
            
            articles = searchResult
            print("searchResultの結果は、\(searchResult)")
        }
        //        //テーブルを再読み込みする。
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let article = articles[indexPath.row]
        cell.set(imageUrl:article.image.i_320_131, title: article.title, Subtitle: article.looking_for, logoUrl:article.company.avatar.original,company_name: article.company.name)
        //        cell.set(title: article.title, author: article.lookingFor,imageUrl: article.lookingFor, lookingFor: article.llookingFor)
        return cell
    }
    
}


extension ViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let detailVC = storyboard.instantiateInitialViewController() as! DetailViewController
        // indexPathを使用してarticlesから選択されたarticleを取得
        let article = articles[indexPath.row]
        //        detailVC.set(imageUrl: article.image.i_320_131, title: article.title, Subtitle: article.looking_for, logoUrl: article.company.avatar.original, company_name: article.company.name)
        //        // ④urlとtitleを代入
        detailVC.mainTitle = article.title
        detailVC.subTitle = article.looking_for
        detailVC.ImageView = article.image.i_320_131
        detailVC.logoimage = article.company.avatar.original
        detailVC.company = article.company.name
        detailVC.Text = article.description
        detailVC.Founder = article.company.founder
        detailVC.FounderText = article.staffings[0].description
      
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
