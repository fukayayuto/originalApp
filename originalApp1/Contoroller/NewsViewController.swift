//
//  NewsViewController.swift
//  originalApp1
//
//  Created by 深谷祐斗 on 2020/06/27.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import SegementSlide
import SwiftyJSON



class NewsViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate{

    var newsData = [NewsData]()
    
    //XMLParserのインスタンス化
    var parser = XMLParser()
   
     var currentElemantName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        tableView.backgroundColor = .darkGray
        
        let urlString = "https://news.google.com/news/rss/headlines/section/topic/NATION.ja_jp/%E5%9B%BD%E5%86%85?ned=jp&hl=ja&gl=JP"
               let url:URL = URL(string:urlString)!
               parser = XMLParser(contentsOf: url)!
               parser.delegate = self
               parser.parse()
           
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/8
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        let newsData = self.newsData[indexPath.row]
        cell.NewsTextLabel.text = newsData.title
        cell.pubdataTextLabel.text = newsData.pubDate
        
        return cell
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//       let newsData = self.newsData[indexPath.row]
//        cell.textLabel?.text = newsData.title
//        cell.detailTextLabel?.text = newsData.url
        
       
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
           
           currentElemantName = nil
           if elementName == "item"{
               
               self.newsData.append(NewsData())
       
               
           }else{
               
               currentElemantName = elementName
               
           }
       }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
           
           if self.newsData.count > 0{
               
               let lastItem = self.newsData[self.newsData.count - 1]
               
               switch self.currentElemantName {
               case "title":
                   lastItem.title = string
               case "link":
                   lastItem.url = string
               case "pubDate":
                   lastItem.pubDate = string
               default:break
                   
               }
               
               
           }
       }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
           self.currentElemantName = nil
       }
       
       
       func parserDidEndDocument(_ parser: XMLParser) {
           self.tableView.reloadData()
       }
       
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("エラー:" + parseError.localizedDescription)
    }
    
    
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


           let webviewContorller = WebViewController()
           let newsItem = newsData[indexPath.row]
           UserDefaults.standard.set(newsItem.url, forKey: "url")
           present(webviewContorller,animated: true ,completion: nil)

       }

    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
