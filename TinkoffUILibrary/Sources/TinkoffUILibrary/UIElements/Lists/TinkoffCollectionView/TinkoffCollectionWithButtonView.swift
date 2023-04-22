//
//  TinkoffCollectionWithButtonView.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

class TinkoffCollectionWithButtonView: TinkoffCollectionView {

	public var buttonTitle: String? {
		didSet {
			ctaButton.setTitle(buttonTitle, for: .normal)
		}
	}

	private let buttonContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	internal let ctaButton: TinkoffButton = {
		let button = TinkoffButton()
		button.setTitle("Button", for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	override func setup() {
		super.setup()
		stackView.addArrangedSubview(buttonContainer)
		buttonContainer.addSubview(ctaButton)
		ctaButton.addTarget(self, action: #selector(ctaTapped), for: .primaryActionTriggered)
		NSLayoutConstraint.activate([
			ctaButton.heightAnchor.constraint(equalToConstant: 44),
			ctaButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor),
			ctaButton.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor, constant: 20),
			ctaButton.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor),
			ctaButton.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor, constant: -20)
		])
	}

	@objc private func ctaTapped() {
		delegate?.didTapCTAButton()
	}
}
