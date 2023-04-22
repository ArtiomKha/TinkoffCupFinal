//
//  TiinkoffButtonCardView.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

class TiinkoffButtonCardView: TinkoffCardView {

	public var buttonTitle: String? {
		didSet {
			ctaButton.setTitle(buttonTitle, for: .normal)
		}
	}

	public let ctaButton: TinkoffButton = {
		let button = TinkoffButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	override func setup() {
		super.setup()
		stackView.addArrangedSubview(ctaButton)
		ctaButton.addTarget(self, action: #selector(ctaTapped), for: .primaryActionTriggered)
		NSLayoutConstraint.activate([
			ctaButton.heightAnchor.constraint(equalToConstant: 44)
		])
	}

	@objc private func ctaTapped() {
		delegate?.didTapCTAButton()
	}
}
