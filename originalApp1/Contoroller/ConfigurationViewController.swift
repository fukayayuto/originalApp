//
//  ConfigurationViewController.swift
//  originalApp1
//
//  Created by 深谷祐斗 on 2020/07/05.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//
//
//import UIKit
//
//class ConfigurationViewController: UIViewController,UITextFieldDelegate {
//
//    var strArray:String = ""
//    var birthDay = ""
//    var birthData = Array<Any>()
//    var birth_date = ""
//    var birth_time = ""
//
//
//    var birthTime = ""
//    private var firstAppear: Bool = false
//
//
//    @IBOutlet let todoTextFiled = UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        view.backgroundColor = .white
//
//        let timeTextField = UITextField(frame: CGRect(x:100, y: 300, width: view.frame.size.width/2, height: view.frame.size.width/8))
//        timeTextField.backgroundColor = .white
//        timeTextField.placeholder = "時間を指定"
//        self.view.addSubview(timeTextField)
//
//        let todoTextFiled = UITextField(frame: CGRect(x:100, y: 400, width: view.frame.size.width/2, height: view.frame.size.width/8))
//               todoTextFiled.backgroundColor = .white
//               todoTextFiled.placeholder = "todoを記入"
//               self.view.addSubview(todoTextFiled)
//
//        let plusbutton:UIButton = UIButton(frame: CGRect(x: 150, y:500, width: 80, height: 80))
//         plusbutton.backgroundColor = .lightGray
//         plusbutton.layer.cornerRadius = 30
//         plusbutton.setTitle("+", for: .normal)
//        plusbutton.setTitleColor(.white, for: .normal)
//        plusbutton.addTarget(self, action: #selector(pushPlusButton), for: .touchUpInside)
//        self.view.addSubview(plusbutton)
//
//            if !firstAppear {
//                if UserDefaults.standard.object(forKey: "todoTime") != nil{
//                    birthDay = UserDefaults.standard.object(forKey: "todoTime") as! String
//                }
//                let str:String = birthDay
//                // 生年月日データをスペースで分割　前半は年月日、後半は時間
//                let strArray = str.split(separator: " ")
//
//                birth_date = String(strArray[0])
//                birth_time = String(strArray[1])
//                if(birth_time == "none"){
//                    todoTextFiled.text = ""
//                    chkBox.isChecked = true
//                }else{
//                    timeTextField.text = birth_time
//                }
//                timeTextField.text = birth_date
//                firstAppear = true
//            }
//        }
//
//    @objc func pushPlusButton(sender: UIButton){
//
//        birthDay = todoTextFiled.text!
//        //時間が分からない場合はスペースを保存。
//        //保存済みの時間があれば上書きして無しにする。
//
//        if(chkBox.isChecked){
//            timeTextField.text = ""
//            birthDay = birthDay + " " + "none"
//        }else{
//            birthDay = birthDay + " " + timeTextField.text!
//        }
//        UserDefaults.standard.setValue(birthDay, forKey: "birthday")
//
//        }
//
//
//
//
//
//
//
//
//
//
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
