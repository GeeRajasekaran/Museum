//
//  MuseumInfoListViewController.swift
//  Museum
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import UIKit

class MuseumInfoListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    // MARK:- IBOutlets
    
    @IBOutlet var tableView:UITableView!
    
    
    var floorDetailArr = [FloorDetail]()
    
    var museumCellIdentifier = "MuseumCell"
    var museumInfoArray = [Floorinfo]()
    // MARK:- Viewconntroller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self .initialSetup()
        // Do any additional setup after loading the view.
    }
    
    func initialSetup()  {
        
        self.navigationController?.navigationBar.isHidden = false
        tableView.register(UINib(nibName: "MeseumInfoTableViewCell", bundle: nil), forCellReuseIdentifier: museumCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        museumInfoArray.append(Floorinfo(name: "Ground Floor", desc: "Here you can see engine hall and dinosaur alive", img1: UIImage(named: "dieselenngine2")!, img2: UIImage(named: "dinnosarbig")!))
        museumInfoArray.append(Floorinfo(name: "First Floor", desc: "Here you can see electro technique and fun science", img1: UIImage(named: "machinebbox")!, img2: UIImage(named: "rockets")!))
        museumInfoArray.append(Floorinfo(name: "Second Floor", desc: "here you can see bio technological revolution and space emerging technology in the service of mankind", img1: UIImage(named: "dieselenngine2")!, img2: UIImage(named: "satellite")!))
        museumInfoArray.append(Floorinfo(name: "Third Floor", desc: "BEL hall of electronics and childrens science", img1: UIImage(named: "dieselenngine2")!, img2: UIImage(named: "dinnosarbig")!))
        museumInfoArray.append(Floorinfo(name: "Fourth Floor", desc: "Cafetaria",img1: UIImage(named: "dieselenngine2")!, img2: UIImage(named: "storyofspace")!))


    }

    // MARK:- Tabbleview delegates and datasources
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return museumInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: museumCellIdentifier, for: indexPath) as! MeseumInfoTableViewCell
        let floorInfo = museumInfoArray[indexPath.row]
        
        cell.detailInfo = floorInfo
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let detailVC = DetailViewController.instantiate(from: .Main)
            detailVC.floorDetailArr = floorDetailArr
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        // animation 1
        /*
         let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
         cell.layer.transform = rotationTransform
         cell.alpha = 0.5
         
         UIView.animate(withDuration: 1.0) {
         cell.layer.transform = CATransform3DIdentity
         cell.alpha = 1.0
         }
         */
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
}

