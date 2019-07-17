//
//  ViewController.swift
//  Museum
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class parentVC: UIViewController {

    
    
    var floorDetailArr = [FloorDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self .initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }

    //MARK: - Custom Methods
    func initialSetup()  {
        
        let info1 = FloorDetail.init(name: "about visvesvaraya museum", status: true, fDetail: "first floor", desc: "", img: UIImage(named: "about")!)
        floorDetailArr.append(info1)
        let info2 = FloorDetail.init(name: "chevroletengine", status: false, fDetail: "first floor", desc: "chevroletengine", img: UIImage(named: "chevroletengine")!)
        floorDetailArr.append(info2)
        
        let info3 = FloorDetail.init(name: "dieselengine", status: false, fDetail: "first floor", desc: "dieselengine", img: UIImage(named: "dieselengine")!)
        floorDetailArr.append(info3)
        
        let info4 = FloorDetail.init(name: "dieselenngine2", status: false, fDetail: "first floor", desc: "dieselenngine2", img: UIImage(named: "dieselenngine2")!)
        floorDetailArr.append(info4)
        
        let info5 = FloorDetail.init(name: "dinnosarbig", status: false, fDetail: "first floor", desc: "dinnosarbig", img: UIImage(named: "dinnosarbig")!)
        floorDetailArr.append(info5)
        
        let info6 = FloorDetail.init(name: "Dinosar", status: false, fDetail: "first floor", desc: "Dinosar", img: UIImage(named: "Dinosar")!)
        floorDetailArr.append(info6)
        
        let info7 = FloorDetail.init(name: "machinebbox", status: false, fDetail: "first floor", desc: "machinebbox", img: UIImage(named: "machinebbox")!)
        floorDetailArr.append(info7)
        
        let info8 = FloorDetail.init(name: "mechannisms", status: false, fDetail: "first floor", desc: "mechannisms", img: UIImage(named: "mechannisms")!)
        floorDetailArr.append(info8)
        
        let info9 = FloorDetail.init(name: "pumps", status: false, fDetail: "first floor", desc: "pumps", img: UIImage(named: "pumps")!)
        floorDetailArr.append(info9)
        
        let info10 = FloorDetail.init(name: "raksharma", status: false, fDetail: "first floor", desc: "raksharma", img: UIImage(named: "raksharma")!)
        floorDetailArr.append(info10)
        
        let info11 = FloorDetail.init(name: "rockets", status: false, fDetail: "first floor", desc: "rockets", img: UIImage(named: "rockets")!)
        floorDetailArr.append(info11)
        
        let info12 = FloorDetail.init(name: "satellite", status: false, fDetail: "first floor", desc: "satellite", img: UIImage(named: "satellite")!)
        floorDetailArr.append(info12)
        
        let info13 = FloorDetail.init(name: "simplemachine", status: false, fDetail: "first floor", desc: "simplemachine", img: UIImage(named: "simplemachine")!)
        floorDetailArr.append(info13)
        
        let info14 = FloorDetail.init(name: "storyofspace", status: false, fDetail: "first floor", desc: "storyofspace", img: UIImage(named: "storyofspace")!)
        floorDetailArr.append(info14)
        
       
        
        let myTestImg = UIImage(named: "storyofspace")
        let filteredArr = floorDetailArr.filter({$0.img == myTestImg})
        filteredArr.first?.seenStatus = true
        
        print(index)
    }
   
    // MARK:- Action Methods
    
    @IBAction func infoBtnTapped(_ sender: UIButton) {
        
        let museumInfoVC = MuseumInfoListViewController.instantiate(from: .Main)
        museumInfoVC.floorDetailArr = floorDetailArr
        self.navigationController?.pushViewController(museumInfoVC, animated: true)
    }
}
