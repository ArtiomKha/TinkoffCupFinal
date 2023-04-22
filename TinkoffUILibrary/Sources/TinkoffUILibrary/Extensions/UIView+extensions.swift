//
//  UIView+extensions.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

extension UIView {
	func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
	  layer.masksToBounds = false
	  layer.shadowColor = color.cgColor
	  layer.shadowOpacity = opacity
	  layer.shadowOffset = offSet
	  layer.shadowRadius = radius

	  layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
	  layer.shouldRasterize = true
	  layer.rasterizationScale = scale ? UIScreen.main.scale : 1
	}

	func removeShadow() {
		layer.shadowColor = nil
		layer.shadowOpacity = 0
		layer.shadowOffset = .zero
		layer.shadowRadius = 0
		layer.shadowPath = nil
	}
}
