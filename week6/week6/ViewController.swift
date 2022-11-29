//
//  ViewController.swift
//  week6
//
//  Created by 박윤빈 on 2022/10/31.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet var alarmTimeTop: NSLayoutConstraint!
    @IBOutlet var alarmTimeHeight: NSLayoutConstraint!
    @IBOutlet var lblCurrentTime: UILabel! //현재 시간이 표시될 부분
    @IBOutlet var lblPickerTime: UILabel! // 설정할 시간이 표시될 부분
    @IBOutlet var alarmTimeDidTap: UITapGestureRecognizer!
    var alarmTime : String = ""
    var count = 0
    var alarmTouch = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)//1초마다 updatetime함수를 실행시키는 타이머
        alarmTimeDidTap.addTarget(self, action: #selector(alarmTapAction))
      
    }
 
    @objc func updateTime(){
        let date = NSDate() //현재 시간을 가져옴
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd EEE hh:mm:ss"

        lblCurrentTime.text = "현재시간: \(formatter.string(from: date as Date))" //.string 메소드를 활용해서 formatter의 타입을 String으로 변환
        
        formatter.dateFormat = "hh:mm"
        let currentTime = formatter.string(from: date as Date)
        if alarmTime == currentTime{
            count+=1
            if count % 2 == 1{
                view.backgroundColor = UIColor.yellow
            }else{
                view.backgroundColor = UIColor.green
            }
        }else{
            view.backgroundColor = UIColor.white
        }
        
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) { //데이트피커 시간 설정 액션
        let datePickerView = sender //datePickerView 선택한 값 저장
        let formatter = DateFormatter() // 날짜를 표시할 형식으로 정하기
        formatter.dateFormat = "yyyy-MM-dd EEE hh:mm"
        
        lblPickerTime.text = "설정 시간: \(formatter.string(from: datePickerView.date))"
        
        formatter.dateFormat = "hh:mm"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func alarmTapAction(){
        alarmTouch+=1
        
        if alarmTouch%2 == 1{
            UILabel.animate(withDuration: 2, animations: {
                self.alarmTimeTop.constant = 50
                self.alarmTimeHeight.constant = 235
                //self.currentTimeTop.constant = 500
                self.view.layoutIfNeeded()})
        } else{
            UILabel.animate(withDuration: 2, animations: {
                self.alarmTimeTop.constant = 246
                self.alarmTimeHeight.constant = 21
                //self.currentTimeTop
                self.view.layoutIfNeeded()

                    })
        }
        
    }
}

