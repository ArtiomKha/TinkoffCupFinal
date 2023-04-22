//
//  TinkoffCardDelegate.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

public protocol TinkoffCardViewDelegate: AnyObject {
	func didTapCTAButton()
	func didtapCloseButton()
}

public extension TinkoffCardViewDelegate {
	func didTapCTAButton() { }
	func didtapCloseButton() { }
}
