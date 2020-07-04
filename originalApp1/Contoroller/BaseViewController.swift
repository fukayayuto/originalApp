//
//  BaseViewController.swift
//  originalApp1
//
//  Created by 深谷祐斗 on 2020/06/27.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import SegementSlide

class BaseViewController: SegementSlideDefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
        defaultSelectedIndex = 0
       
    }

    override var titlesInSwitcher: [String]{

        return["予定","天気","ニュース"]
        
        }



 override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
       switch index {
       case 0:
       return ScheduleViewController()
        
       case 1:
        return WeatherViewController()
        
       case 2:
        return NewsViewController()
       
       default:
           return ScheduleViewController()
       }
   }

}
