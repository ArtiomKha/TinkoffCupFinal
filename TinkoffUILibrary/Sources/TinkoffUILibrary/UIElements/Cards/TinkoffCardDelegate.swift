//
//  TinkoffCardDelegate.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

protocol TinkoffCardViewDelegate: AnyObject {
	func didTapCTAButton()
	func didtapCloseButton()
}

extension TinkoffCardViewDelegate {
	func didTapCTAButton() { }
	func didtapCloseButton() { }
}
