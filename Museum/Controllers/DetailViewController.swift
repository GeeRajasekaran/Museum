//
//  DetailViewController.swift
//  Museum
//
//  Created by CVN on 16/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    

    // MARK:- IBOutlets
    
    @IBOutlet var tableView:UITableView!

    var detailArray = ["1","2","3","4","5"]
    var museumDetailCellIdentifier = "DetailCell"
    var floorDetailArr = [FloorDetail]()
    var context = CIContext(options: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        self .initialSetup()
        // Do any additional setup after loading the view.
    }
    
    func initialSetup()  {
        
        self.navigationController?.navigationBar.isHidden = false
        tableView.register(UINib(nibName: "MuseumDetailinfoTableViewCell", bundle: nil), forCellReuseIdentifier: museumDetailCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func blurEffect(img:UIImageView) {
        
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: img.image!)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(10, forKey: kCIInputRadiusKey)
        
        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")
        
        let output = cropFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        img.image = processedImage
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return floorDetailArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: museumDetailCellIdentifier, for: indexPath) as! MuseumDetailinfoTableViewCell
        let floorInfo = floorDetailArr[indexPath.row]
       
        cell.detailInfo = floorInfo
        cell.isUserInteractionEnabled = false
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
            }
            else{
                cell.accessoryType = .checkmark
            }
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        // animation 1
        
         let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
         cell.layer.transform = rotationTransform
         cell.alpha = 0.5
         
         UIView.animate(withDuration: 1.0) {
         cell.layer.transform = CATransform3DIdentity
         cell.alpha = 1.0
         }
        
        
//        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
//        cell.layer.transform = rotationTransform
//        cell.alpha = 0
//        UIView.animate(withDuration: 0.75) {
//            cell.layer.transform = CATransform3DIdentity
//            cell.alpha = 1.0
//        }
    }
    
}
