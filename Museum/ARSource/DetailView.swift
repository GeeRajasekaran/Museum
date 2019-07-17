//
//  DetailView.swift
//  MuseumARSim
//
//  Created by Andrew Hart on 21/05/2019.
//  Copyright © 2019 Dent Reality. All rights reserved.
//

import UIKit

protocol DetailViewDelegate: class {
	func detailViewWasDismissed(detailView: DetailView)
}

class DetailView: UIView {
	var title: String? {
		set {
			titleView.text = newValue
		}
		get {
			return titleView.text
		}
	}
	
	var summary: String? {
		set {
			summaryView.text = newValue
		}
		get {
			return summaryView.text
		}
	}
	
	weak var delegate: DetailViewDelegate?
	
	private var titleView = UILabel()
//    private var summaryView = UILabel()
    private var summaryView = UITextView()
	
	private var dismissView = UILabel()
	
	private static let contentInset: CGFloat = 24
	
	private let dismissButton = UIButton()
	
	init() {
		super.init(frame: CGRect.zero)
		
		titleView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		titleView.textColor = UIColor.white
		titleView.numberOfLines = 0
		addSubview(titleView)
		
        summaryView.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        summaryView.textColor =  UIColor.white
        summaryView.backgroundColor = UIColor.clear
        summaryView.isScrollEnabled = true
        summaryView.isEditable = false
        summaryView.sizeToFit()
        addSubview(summaryView)
		
		dismissView.font = UIFont.systemFont(ofSize: 16, weight: .bold)
		dismissView.text = "TAP TO DISMISS"
		dismissView.textColor = UIColor.white
		dismissView.sizeToFit()
//        addSubview(dismissView)
		
        //Dismiss Button  prop
        dismissButton.backgroundColor = UIColor.red
        dismissButton.setTitle("DISMISS", for: .normal)
        dismissButton.setTitleColor(UIColor.white, for: .normal)
        dismissButton.backgroundColor = UIColor.clear
        dismissButton.layer.cornerRadius = 5
        dismissButton.layer.borderWidth = 1
        dismissButton.layer.borderColor = UIColor.white.cgColor
        dismissButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
		dismissButton.addTarget(self, action: #selector(respondToButtonTapped), for: .touchUpInside)
        
		addSubview(dismissButton)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let maxSize = CGSize(
			width: max(0, frame.size.width - (DetailView.contentInset * 2)),
			height: CGFloat.greatestFiniteMagnitude)
		
		titleView.frame.size = titleView.sizeThatFits(maxSize)
		summaryView.frame.size = summaryView.sizeThatFits(maxSize)
		
		let dismissViewY = frame.size.height - DetailView.contentInset - safeAreaInsets.bottom - dismissView.frame.size.height
		
		dismissView.frame.origin = CGPoint(x: DetailView.contentInset, y: dismissViewY)
		
		let summaryViewY = dismissView.frame.origin.y - DetailView.contentInset - summaryView.frame.size.height
		
        titleView.frame = CGRect(
            x: DetailView.contentInset,
            y: self.frame.size.height / 2 + 80,
            width: titleView.frame.size.width,
            height: 40)
        
        let summaryViewHeight = heightForView(text: summaryView.text ?? "", font: UIFont.systemFont(ofSize: 16, weight: .bold), width: titleView.frame.size.width)
        
        summaryView.frame = CGRect(
            x: DetailView.contentInset,
            y: titleView.frame.origin.y + titleView.frame.size.height + 10,
            width: summaryView.frame.size.width,
            height: summaryViewHeight > 200 ? 200 : summaryViewHeight)
        
        dismissButton.frame = CGRect(
            x: DetailView.contentInset,
            y:  summaryView.frame.origin.y + summaryView.frame.size.height + 10,
            width: 100, height: 45)
        
//        summaryView.frame = CGRect(
//            x: DetailView.contentInset,
//            y: summaryViewY,
//            width: summaryView.frame.size.width,
//            height: summaryView.frame.size.height)
        
//        titleView.frame = CGRect(
//            x: DetailView.contentInset,
//            y: summaryViewY - DetailView.contentInset - titleView.frame.size.height,
//            width: titleView.frame.size.width, height: titleView.frame.size.height)
		
//        dismissButton.frame = bounds
       
       
//        dismissButton.frame = CGRect(
//            x: DetailView.contentInset,
//            y: summaryViewY + 925,
//            width: 100, height: 45)
        
       

    }
    
    // Help tp convert the text to height
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
	
	@objc func respondToButtonTapped() {
		delegate?.detailViewWasDismissed(detailView: self)
	}
}
