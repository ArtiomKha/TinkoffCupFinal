//
//  TinkoffButton.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

class TinkoffButton: UIButton {

	override var isHighlighted: Bool {
		didSet {
			backgroundColor = isHighlighted ? Colors.CTAButton.highlightedBackground : Colors.CTAButton.background
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	init() {
		super.init(frame: .zero)
		setup()
	}

	func setup() {
		layer.masksToBounds = true
		layer.cornerRadius = 12
		setTitleColor(Colors.CTAButton.title, for: .normal)
		backgroundColor = isHighlighted ? Colors.CTAButton.highlightedBackground : Colors.CTAButton.background
	}
}
