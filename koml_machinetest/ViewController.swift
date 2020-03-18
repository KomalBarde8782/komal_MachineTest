//
//  ViewController.swift
//  koml_machinetest
//
//  Created by Script Lanes on 09/03/20.
//  Copyright © 2020 Script Lanes. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var articleTableView: UITableView!
    var tableArray  = [Articles]()
     var heroTableArray  = [Hero_Base?]()
    var newHeroTable = [Hero_Base]()
    override func viewDidLoad(){
        super.viewDidLoad()
        articleTableView.delegate = self
        articleTableView.dataSource = self
        articleTableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        //self.getArticles()
       self.getNewArticles()
       // self.getHerosData()
    }

    
    
    func getNewArticles(){
        ArticleManager.sharedInstance.fetchNewJsonData { (succes, articleData) in
            if succes{
                print("Success in get new articles")
                if let data = articleData{
                  self.tableArray = data
                    print("table array :\(self.tableArray.map{$0.title})")
                    self.articleTableView.reloadData()
                }
            }else{
                print("something went wrong n getNewArticles")
            }
        }
    }
}




extension ViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        let articleObj = self.tableArray[indexPath.row]
        cell.authorLbl.text = articleObj.author
        cell.descriptionLabel.text = articleObj.description
        cell.titlelabel.text = articleObj.title
        
        if let image = VBDocumentDirectoryManager.sharedInstance.getImage(urlStr: articleObj.urlToImage!){
            cell.articleImage.image = image
        }else{
            cell.articleImage.image = #imageLiteral(resourceName: "bluetooth")
            SDImageCache.shared.config.shouldCacheImagesInMemory = false
            if let imaheUrl = articleObj.urlToImage{
                if let url = URL(string: imaheUrl){
                    SDWebImageManager.shared.loadImage(with: url, options: .continueInBackground, progress: { (recived, expected, imageUrl) in
                    }) { (image, imageData, eroor, cacheType, sucess, imageUrl) in
                        if let downLoadedImage =  image{
                            cell.articleImage.image = downLoadedImage
                            if let imgData = downLoadedImage.jpegData(compressionQuality: 0.5){
                                VBDocumentDirectoryManager.sharedInstance.saveImageToDocumentDirectory(imageData: imgData, fileName: imageUrl?.absoluteString ?? "")
                            }
                        }
                        
                    }
                }// end of if
            }
            
        }// end of else
        
        return cell
    }
    

    
    
}
