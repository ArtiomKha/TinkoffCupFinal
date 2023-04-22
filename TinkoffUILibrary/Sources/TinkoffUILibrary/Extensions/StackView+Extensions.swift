//
//  StackView+Extensions.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

extension UIStackView {

	func removeAllArrangedSubviews() -> [UIView] {
		let removedSubviews = arrangedSubviews.reduce([]) { (removedSubviews, subview) -> [UIView] in
			self.removeArrangedSubview(subview)
			NSLayoutConstraint.deactivate(subview.constraints)
			subview.removeFromSuperview()
			return removedSubviews + [subview]
		}
		return removedSubviews
	}

	private func createSpacerView(axis: NSLayoutConstraint.Axis = .horizontal) -> UIView {
		let view = UIView()
		view.setContentHuggingPriority(.init(1), for: axis)
		view.backgroundColor = .clear
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}

	func addArrangedSpacerView(axis: NSLayoutConstraint.Axis = .horizontal) -> UIView {
		let spacerView = createSpacerView(axis: axis)
		addArrangedSubview(spacerView)
		return spacerView
	}
}
