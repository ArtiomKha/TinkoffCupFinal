//
//  TinkoffCollectionViewDelegate.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit


protocol TinkoffCollectionViewDelegate: AnyObject {
	func didSelectItem(at index: Int)
	func didTapBarButton()
	func didTapCTAButton()
}

extension TinkoffCollectionViewDelegate {
	func didTapCTAButton() { }
}
