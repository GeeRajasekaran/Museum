//
//  ARViewController.swift
//  Museum
//
//  Created by Surya on 17/07/19.
//  Copyright © 2019 Agiliztech. All rights reserved.
//

import UIKit
import ARKit

class ARViewController: parentVC {
    
    let artView = ARArtView()
    var beacons = [Beacon]()
    
    
    //MAR: - View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artView.delegate = self
        //        artView.sceneView.delegate = self
        view.addSubview(artView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //configure AR refrence images
        self.configureARRefrenceImages()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        artView.pause()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        artView.frame = view.bounds
    }
    
    //MARK: - Custom methods
    /**
     * This methos is used to configure the AR refrence Images
     */
    
    private func configureARRefrenceImages(){
        
        let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)
        
        artView.run(detectionImages: referenceImages)
    }
}

extension ARViewController: ARArtViewDelegate {
    
    
    func artworkForDetectedImage(artView: ARArtView, image: ARReferenceImage) -> Artwork? {
        
        print("New image \(image.name)")
        beacons.removeAll()
        
        if image.name == "sattilite"{


            let beacon1 = Beacon(
                contentTitle: "warrior suite",
                contentSummary: "Tamil warrior suite.",
                position: SCNVector3(-0.30, -0.30, 0))
            beacons.append(beacon1)

            let beacon2 = Beacon(
                contentTitle: "warrior Helemet",
                contentSummary: "Helemt which is used in war",
                position: SCNVector3(0.25, 0.5, 0))
            beacons.append(beacon2)

            let beacon3 = Beacon(
                contentTitle: "warrior sword",
                contentSummary: "sword which is used in war in 1719",
                position: SCNVector3(0.60, -0.45, 0))
            beacons.append(beacon3)


            let artwork = Artwork(
                width: 3,
                height: 2,
                beacons: beacons,
                title: "Equipments of tamil warrior from 1759",
                dateString: "28 June 1759",
                author: "surya",
                image: nil)

            return artwork
        }
       else if image.name == "rakeshAstro"{

            let beacon1 = Beacon(
                contentTitle: "About Sir M. Visvesvaraya",
                contentSummary: "Eminent engineer and statesman, Sir M. Visvesvaraya was born on September 15, 1860 in Muddenahalli village in Karnataka’s Kolar district. He lost his father, who was a Sanskrit scholar at the age of 15. After completing his early education in Chikkaballapur, he moved to Bangalore for his higher education. /n He joined the Science College in Poona to study Engineering and was ranked first in the L.C.E. and the F.C.E. Examinations in 1883. The Government of Bombay promptly offered him the job of an Assistant Engineer at Nasik. During his stint as an engineer, he successfully implemented many projects. He was the brain behind the Krishnaraja Sagar dam in Mysore./n Known for his simplicity, he was appointed as the Dewan by the Maharaja of Mysore in 1912. During his tenure as the Dewan of Mysore, he worked relentlessly for the overall development of the state. Many new industries came up during his tenure as the Dewan. These include the Sandal Oil Factory, the Soap Factory, the Metals Factory, the Chrome Tanning Factory and the Bhadravati Iron and Steel Works.\n Honored with the Bharat Ratna in 1955, Sir Mokushagundam Visvesvaraya was a pre-eminent engineer, scholar and statesman of India. In order to honor the achievements of the most influential engineer from the history of contemporary India, Engineer’s Day is celebrated on Sir Visvesvaraya’s birthday, 15 September. Throughout his career of about 30 years as an engineer, 20 years as administrator, and 20 years as advisor and statesman, Sir Visvesvaraya contributed significantly in nation-building and his engineering works were spread across the country. Sir Visvesvaraya had a flair for complex engineering and nation building. The Engineering Community across India celebrate 15th September as Engineers Day as a tribute to the greatest Indian Engineer, Sir M Visvesvaraya.",
                position: SCNVector3(0.25, 0.5, 0))
            beacons.append(beacon1)


            let artwork = Artwork(
                width: 3,
                height: 2,
                beacons: beacons,
                title: "Sir M. Visvesvaraya",
                dateString: "15 September 1861 - 12 April 1962",
                author: "",
                image: nil)

            return artwork
        }
        
        return nil
    }
    
    func artWorkRefreshButtonTapped() {
        print("Refresh tapped")
        self.configureARRefrenceImages()
    }
    
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
