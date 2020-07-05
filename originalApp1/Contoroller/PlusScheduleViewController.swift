//
//  PlusScheduleViewController.swift
//  originalApp1
//
//  Created by 深谷祐斗 on 2020/07/05.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class PlusScheduleViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var timeTextFiled: DatePickerKeyboard!
    
    
    @IBOutlet weak var todoTextFied: UITextField!
    
    
    
    
    @IBOutlet weak var plusButton: UIButton!
    
        var strArray:String = ""
        var birthDay = ""
        var birthData = Array<Any>()
        var birth_date = ""
        var birth_time = ""
    
    
        var birthTime = ""
        private var firstAppear: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        plusButton.layer.cornerRadius = 30
        todoTextFied.delegate = self
        timeTextFiled.delegate  = self
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//       super.viewWillAppear(animated)
//           if !firstAppear {
//               if UserDefaults.standard.object(forKey: "birthday") != nil{
//                   birthDay = UserDefaults.standard.object(forKey: "birthday") as! String
//               }
//               let str:String = birthDay
//               // 生年月日データをスペースで分割　前半は年月日、後半は時間
//               let strArray = str.split(separator: " ")
//
//               birth_date = String(strArray[0])
//               birth_time = String(strArray[1])
//               if(birth_time == "none"){
//                   timeTextFiled.text = ""
////                   chkbox.isChecked = true
//               }else{
//                   timeTextFiled.text = birth_time
//               }
//              todoTextFiled.text = birth_date
//               firstAppear = true
//           }
//       }

    
    @IBAction func plus(_ sender: Any) {
        
        if timeTextFiled != nil && todoTextFied != nil{
            
            UserDefaults.standard.set(timeTextFiled.text, forKey: "Time")
            UserDefaults.standard.set(todoTextFied.text, forKey: "Todo")
            dismiss(animated: true, completion: nil)
        }else{
            
            dismiss(animated: true, completion: nil)
            
        }
        
        
        
                //時間が分からない場合はスペースを保存。
                //保存済みの時間があれば上書きして無しにする。
        
//                if(chkBox.isChecked){
//                    timeTextField.text = ""
//                    birthDay = birthDay + " " + "none"
//                }else{
//                    birthDay = birthDay + " " + timeTextField.text!
//                }
//                UserDefaults.standard.setValue(birthDay, forKey: "birthday")
        
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
