//
//  WeatherViewController.swift
//  originalApp1
//
//  Created by 深谷祐斗 on 2020/06/27.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import SegementSlide
import SwiftyJSON
import Alamofire


class WeatherViewController: UITableViewController,SegementSlideContentScrollViewDelegate{
   
    

//    var weatherData = WeatherData()
    var areaStringArray = [String]()
    var weatherIconArray = [String]()
    var tempuretureArray = [Double]()
    var descriptionArray = [String]()
    var weatherIdArray = [Int]()
    
//    var pickerView: UIPickerView = UIPickerView()
//    let list = ["Osaka", "Tokyo", "Nagoya", "Okinawa"]
//
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         tableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
        
        
//      pickerView.delegate = self
//      pickerView.dataSource = self
//      pickerView.showsSelectionIndicator = true

//      let areaButton = UIButton(frame: CGRect(x: 50, y:100, width: 150, height: 80))
//      areaButton.backgroundColor = .black
//      let areaItem = areaButton.addTarget(self, action: #selector(done), for: .touchUpInside)
//      let cancelItem = areaButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
//      self.view.addSubview(areaButton)

//         plusbutton.addTarget(self, action: #selector(pushPlusButton), for: .touchUpInside)
        
//      self.textField.inputView = pickerView
//      self.textField.inputAccessoryView = areaButton
        
        
        getData()
        
    }
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//           1
//       }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return list.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return list[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        self.textField.text = list[row]
//    }
//
//    @objc func cancel() {
//        self.textField.text = ""
//        self.textField.endEditing(true)
//    }
//
//    @objc func done() {
//        self.textField.endEditing(true)
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherIconArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherCell
        cell.areaTextLabel.text = areaStringArray[indexPath.row]
        cell.descriptionLabel.text = descriptionArray[indexPath.row]
//        cell.tempuretureLabel.text = String(tempuretureArray[indexPath.row])
        
        switch weatherIdArray[0]{
        case 200..<300:   cell.IconLabel.text = "⚡️"
        case 300..<400:  cell.IconLabel.text = "🌫"
        case 500..<600:  cell.IconLabel.text = "☔️"
        case 600..<700:  cell.IconLabel.text = "⛄️"
        case 700..<800: cell.IconLabel.text = "🌪"
        case 800:  cell.IconLabel.text = "☀️"
        case 801..<900: cell.IconLabel.text = "☁️"
        case 900..<1000: cell.IconLabel.text = "🌀"
        default:  cell.IconLabel.text = "☁️"
               }
        
        
        
        
    
    return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height
    }
    
     func getData(){
            
//        var APIkey = "e04fe4486dabd3474c04d1ab09072920"
//        var area = "Osaka"
        let urlText:String = "https://api.openweathermap.org/data/2.5/weather?lang=ja&q=Osaka&appid=e04fe4486dabd3474c04d1ab09072920"
        let urlQuery = urlText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlQuery!)
       
        AF.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON{ responce in
            
                
            switch responce.result{
                            
            case .success:
                            
            let json:JSON = JSON(responce.data as Any)
            print(json)
            let weatherIcon = json["weather"][0]["main"].string
            let tempureture = json["main"][0]["temp"].double
            let area  = json["name"].string
            let description = json["weather"][0]["description"].string
            let weatherId = json["weather"][0]["id"].int
            
            
            self.weatherIconArray.append(weatherIcon!)
//            self.tempuretureArray.append(tempureture!)
            self.areaStringArray.append(area!)
            self.descriptionArray.append(description!)
            self.weatherIdArray.append(weatherId!)
                            
           case.failure:
            break
                            
            }
            self.tableView.reloadData()
        }
                
//                switch responce.result{
//
//                case .success:
//
//                        let json:JSON = JSON(responce.data as Any)
//                        let weatherID = json["weather"][0]["icon"].string
////                        let areaString = json["sys"][0]["area"].string
//
//
//                        self.weatherIconArray.append(weatherID!)
////                        self.areaStringArray.append(areaString!)
//
//                case.failure:
//                    break
//
//                }
//
//                self.tableView.reloadData()
//
//            }
//    }
        
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

         Configure the cell...

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
    
}
