//
//  EatWhat.swift
//  eatwhat
//
//  Created by cloud on 2017/9/3.
//  Copyright © 2017年 cloud. All rights reserved.
//

import UIKit


//let creatUserTable = "CREATE TABLE IF NOT EXISTS 't_EatWhat' ( 'ID' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'breakfast' TEXT,'lunch' TEXT,'dinner' TEXT,'snacks' TEXT,'shit1' TEXT,'shit2' TEXT,'shit3' TEXT,'shit4' TEXT,'shit5' TEXT,'libido' TEXT,'tcm' TEXT,'wm' TEXT,'mark' TEXT);"

class EathWhat: NSObject {
    var breakfast: String = ""
    var lunch: String = ""
    var dinner: String = ""
    var snacks: String = ""
    var shit1: String = ""
    var shit2: String = ""
    var shit3: String = ""
    var shit4: String = ""
    var shit5: String = ""
    var libido: String = ""
    var tcm: String = ""
    var wm: String = ""
    var mark: String = ""
    var time: String = ""
    
    
    //构造方法
    required override init() {
        super.init()
    }
    
    //从object解析回来
    required init(coder decoder: NSCoder) {
        self.breakfast = decoder.decodeObject(forKey: "breakfast") as? String ?? ""
        self.lunch = decoder.decodeObject(forKey: "lunch") as? String ?? ""
        self.dinner = decoder.decodeObject(forKey: "dinner") as? String ?? ""
        self.snacks = decoder.decodeObject(forKey: "snacks") as? String ?? ""
        self.shit1 = decoder.decodeObject(forKey: "shit1") as? String ?? ""
        self.shit2 = decoder.decodeObject(forKey: "shit2") as? String ?? ""
        self.shit3 = decoder.decodeObject(forKey: "shit3") as? String ?? ""
        self.shit4 = decoder.decodeObject(forKey: "shit4") as? String ?? ""
        self.shit5 = decoder.decodeObject(forKey: "shit5") as? String ?? ""
        self.libido = decoder.decodeObject(forKey: "libido") as? String ?? ""
        self.tcm = decoder.decodeObject(forKey: "tcm") as? String ?? ""
        self.wm = decoder.decodeObject(forKey: "wm") as? String ?? ""
        self.mark = decoder.decodeObject(forKey: "mark") as? String ?? ""
        self.time = decoder.decodeObject(forKey: "time") as? String ?? ""

    }
    
    //编码成object
    func encode(withCoder coder: NSCoder) {
        coder.encode(breakfast, forKey:"breakfast")
        coder.encode(lunch, forKey:"lunch")
        coder.encode(dinner, forKey:"dinner")
        coder.encode(snacks, forKey:"snacks")
        coder.encode(shit1, forKey:"shit1")
        coder.encode(shit2, forKey:"shit2")
        coder.encode(shit3, forKey:"shit3")
        coder.encode(shit4, forKey:"shit4")
        coder.encode(shit5, forKey:"shit5")
        coder.encode(libido, forKey:"libido")
        coder.encode(tcm, forKey:"tcm")
        coder.encode(wm, forKey:"wm")
        coder.encode(mark, forKey:"mark")
        coder.encode(time, forKey:"time")
    }
    
    
    
    
    
}
