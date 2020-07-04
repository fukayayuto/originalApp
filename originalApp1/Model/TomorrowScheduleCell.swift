//
//  TomorrowScheduleCell.swift
//  originalApp1
//
//  Created by 深谷祐斗 on 2020/07/04.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit

class TomorrowScheduleCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var checkImageView: UIImageView!
    
    
    @IBOutlet weak var timeTextFiled: UITextField!
    
    @IBOutlet weak var todoTextLabel: UILabel!
    
    
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = UIDatePicker.Mode.time
        dp.timeZone = NSTimeZone.local
        dp.locale = Locale.current
        dp.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        return dp
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
        timeTextFiled.delegate = self
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 500, height: 35))
                    let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
                    let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
                    toolbar.setItems([spacelItem, doneItem], animated: true)
                    
                    // インプットビュー設定
                    timeTextFiled.inputView = datePicker
                    timeTextFiled.inputAccessoryView = toolbar
        
    }
    
    @objc func done() {
              timeTextFiled.endEditing(true)
              let formatter = DateFormatter()
              formatter.dateFormat = "MM:dd"
              timeTextFiled.text = "\(formatter.string(from: datePicker.date))"
           
       }
    
    @objc func dateChange(){
              let formatter = DateFormatter()
              formatter.dateFormat = "hh:mm"
              timeTextFiled.text = "\(formatter.string(from:datePicker.date))"
               timeTextFiled.borderStyle = .none
         }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
    }
    
}
