//
//  HomeTableViewController.swift
//  eatwhat
//
//  Created by cloud on 2017/9/3.
//  Copyright © 2017年 cloud. All rights reserved.
//

import UIKit


public class HomeTableViewController : UITableViewController,UITextFieldDelegate {
    
    var tableData = NSMutableArray()
    var eatWhatModel = EathWhat()
    var editingTF = UITextField()

    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "完成", style: .done, target: self, action: #selector(HomeTableViewController.addOneDay))
        
        self.tableData = ["早餐","午餐","晚餐","零食","便便1","便便2","便便3","便便4","便便5","性欲","中药","西药","备注"]
        
    }
    
    
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell")
        cell?.selectionStyle = .none
        let paramTF = cell?.contentView.subviews[0] as! UITextField
        paramTF.tag = 10000+indexPath.row
        paramTF.delegate = self
        
        let paramName = self.tableData[indexPath.row] as! String
        
        paramTF.placeholder = paramName;
        return cell!
    }
    
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        self.editingTF = textField
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        let index = textField.tag-10000
        if index==0 {
            self.eatWhatModel.breakfast = textField.text!
        } else if index==1 {
            self.eatWhatModel.lunch = textField.text!
        } else if index==2 {
            self.eatWhatModel.dinner = textField.text!
        } else if index==3 {
            self.eatWhatModel.snacks = textField.text!
        } else if index==4 {
            self.eatWhatModel.shit1 = textField.text!
        } else if index==5 {
            self.eatWhatModel.shit2 = textField.text!
        } else if index==6 {
            self.eatWhatModel.shit3 = textField.text!
        } else if index==7 {
            self.eatWhatModel.shit4 = textField.text!
        } else if index==8 {
            self.eatWhatModel.shit5 = textField.text!
        } else if index==9 {
            self.eatWhatModel.libido = textField.text!
        } else if index==10 {
            self.eatWhatModel.tcm = textField.text!
        } else if index==11 {
            self.eatWhatModel.wm = textField.text!
        } else if index==12 {
            self.eatWhatModel.mark = textField.text!
        }
    }
    
    public func addOneDay() {
        
        
        self.editingTF.resignFirstResponder()
        
        
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        
        
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyy-MM-dd"
        let strNowTime = timeFormatter.string(from: date) as String
        
        self.eatWhatModel.time = strNowTime
        
        //插入SQL语句
        let insertSQL = "INSERT INTO 't_EatWhat' (breakfast,lunch,dinner,snacks,shit1,shit2,shit3,shit4,shit5,libido,tcm,wm,mark,time) VALUES ('\(self.eatWhatModel.breakfast)','\(self.eatWhatModel.lunch)','\(self.eatWhatModel.dinner)','\(self.eatWhatModel.snacks)','\(self.eatWhatModel.shit1)','\(self.eatWhatModel.shit2)','\(self.eatWhatModel.shit3)','\(self.eatWhatModel.shit4)','\(self.eatWhatModel.shit5)','\(self.eatWhatModel.libido)','\(self.eatWhatModel.tcm)','\(self.eatWhatModel.wm)','\(self.eatWhatModel.mark)','\(self.eatWhatModel.time)');"
        if SQLiteManager.shareInstance().execSQL(SQL: insertSQL) {
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            
            
            let alertController = UIAlertController(title: "系统提示",message: "添加数据成功", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好的", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            print("插入数据成功")
        }else{
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }
        
        
        
    }
}
