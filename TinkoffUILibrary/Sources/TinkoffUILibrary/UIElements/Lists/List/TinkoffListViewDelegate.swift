//
//  TinkoffListViewDelegate.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

public protocol TinkoffListViewDelegate: AnyObject {
	func didSelectItem(at index: Int)
	func didTapBarButton()
	func didTapCTAButton()
}

public extension TinkoffListViewDelegate {
	func didTapCTAButton() { }
}
