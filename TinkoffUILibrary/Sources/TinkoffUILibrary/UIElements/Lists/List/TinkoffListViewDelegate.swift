//
//  TinkoffListViewDelegate.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

protocol TinkoffListViewDelegate: AnyObject {
	func didSelectItem(at index: Int)
	func didTapBarButton()
	func didTapCTAButton()
}

extension TinkoffListViewDelegate {
	func didTapCTAButton() { }
}
