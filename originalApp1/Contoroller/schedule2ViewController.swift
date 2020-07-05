//
//  schedule2ViewController.swift
//  originalApp1
//
//  Created by 深谷祐斗 on 2020/07/05.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class schedule2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var ScheduleTableView: UITableView!
    
     var scheduleArray:[String] = ["体操","ランニング"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ScheduleTableView.register(UINib(nibName: "TomorrowScheduleCell", bundle: nil), forCellReuseIdentifier: "TomorrowScheduleCell")
        
        ScheduleTableView.delegate = self
        ScheduleTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ScheduleTableView.register(UINib(nibName: "TomorrowScheduleCell", bundle: nil), forCellReuseIdentifier: "TomorrowScheduleCell")
               
        ScheduleTableView.delegate = self
        ScheduleTableView.dataSource = self
        ScheduleTableView.reloadData()
        
        if UserDefaults.standard.object(forKey: "Time") != nil && UserDefaults.standard.object(forKey: "Todo") != nil{
            
            scheduleArray.append(UserDefaults.standard.object(forKey: "Todo") as! String)
            
            
        }
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TomorrowScheduleCell") as! TomorrowScheduleCell
              cell.todoTextLabel.text = scheduleArray[indexPath.row]
              
              return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return view.frame.size.height/8
      
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
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
