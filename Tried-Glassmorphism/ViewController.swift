//
//  ViewController.swift
//  Tried-Glassmorphism
//
//  Created by bookpro on 2021/08/23.
//  Copyright © 2021 routeflags. All rights reserved.
//

import UIKit

extension UIView {
	func anchor(top: NSLayoutYAxisAnchor? = nil,
				left: NSLayoutXAxisAnchor? = nil,
				bottom: NSLayoutYAxisAnchor? = nil ,
				right: NSLayoutXAxisAnchor? = nil ,
				paddingTop: CGFloat = 0 ,
				paddingLeft: CGFloat = 0 ,
				paddingBottom: CGFloat = 0 ,
				paddingRight: CGFloat = 0 ,
				width: CGFloat = 0 ,
				height: CGFloat = 0 ,
				centerX: NSLayoutXAxisAnchor? = nil ,
				centerY: NSLayoutYAxisAnchor? = nil ) {
		
		translatesAutoresizingMaskIntoConstraints = false
		
		if let top = top {
			topAnchor.constraint(equalTo: top,
								 constant: paddingTop).isActive = true
		}
		if let left = left {
			leftAnchor.constraint(equalTo: left,
								  constant: paddingLeft).isActive = true
		}
		if let bottom = bottom {
			bottomAnchor.constraint(equalTo: bottom,
									constant: -paddingBottom).isActive = true
		}
		if let right = right {
			rightAnchor.constraint(equalTo: right,
								   constant: -paddingRight).isActive = true
		}
		if width != 0 {
			widthAnchor.constraint(equalToConstant: width).isActive = true
		}
		if height != 0 {
			heightAnchor.constraint(equalToConstant: height).isActive = true
		}
		if let centerX = centerX {
			centerXAnchor.constraint(lessThanOrEqualTo: centerX).isActive = true
		}
		if let centerY = centerY {
			centerYAnchor.constraint(lessThanOrEqualTo: centerY).isActive = true
		}
	}
}

class TestDraw: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.3)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func draw(_ rect: CGRect) {
		let maskLayer = CAShapeLayer()
		maskLayer.frame = rect
		maskLayer.path = UIBezierPath(roundedRect: rect,
									  cornerRadius: 25).cgPath
		layer.mask = maskLayer
		let borderLayer = CAShapeLayer()
		borderLayer.path = maskLayer.path // Reuse the Bezier path
		borderLayer.fillColor = UIColor.clear.cgColor
		borderLayer.strokeColor = UIColor.white.cgColor
		borderLayer.lineWidth = 1
		borderLayer.frame = rect
		layer.addSublayer(borderLayer)

		layer.shadowOpacity = 1
		layer.shadowColor = UIColor.lightGray.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 0)
		layer.shadowRadius = 3

		let path = UIBezierPath(
			roundedRect: bounds.insetBy(dx: 0, dy: 0),
			cornerRadius: 4)
		let hole = UIBezierPath(
			roundedRect: bounds.insetBy(dx: 2, dy: 2),
			cornerRadius: 3)
			.reversing()
		path.append(hole)
		layer.shadowPath = path.cgPath		
		
		"Super !!".draw(at: CGPoint(x: 70, y: 100), withAttributes: [
			NSAttributedString.Key.foregroundColor : UIColor.white,
			NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 50),
		])
	}
}

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let wallpaper = UIImageView(
			image: UIImage.init(named: "fakurian-design-E8Ufcyxz514-unsplash"))
		self.view.addSubview(wallpaper)
		wallpaper.anchor(top: self.view.topAnchor,
						 left: self.view.leftAnchor,
						 width: self.view.bounds.width,
						 centerX: self.view.centerXAnchor,
						 centerY: self.view.centerYAnchor)

		let glass1 = TestDraw(frame: CGRect(x: 0, y: 0,
										   width: 100,
											  height: 100))
		self.view.addSubview(glass1)
		glass1.anchor(top: self.view.topAnchor,
					 left: self.view.leftAnchor,
					 paddingTop: 500,
					 paddingLeft: 50,
					 width: 200,
					 height: 100)
		
		let glass2 = TestDraw(frame: CGRect(x: 0, y: 0,
											width: 100,
											height: 100))
		self.view.addSubview(glass2)
		glass2.anchor(top: self.view.topAnchor,
					  left: self.view.leftAnchor,
					  paddingTop: 550,
					  paddingLeft: 100,
					  width: 300,
					  height: 200)
	}
}
