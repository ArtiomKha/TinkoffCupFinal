//
//  TinkoffListHeaderView.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

class TinkoffListHeaderView: UIView {
	internal let headerStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.alignment = .center
		stackView.distribution = .fill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	let headerLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 1
		label.font = Fonts.List.header
		label.textColor = Colors.List.header
		label.setContentHuggingPriority(.init(200), for: .vertical)
		label.textAlignment = .left
		label.text = "Header"
		return label
	}()

	let topButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitleColor(Colors.primary, for: .normal)
		button.setTitle("Button", for: .normal)
		return button
	}()

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

	internal func setup() {
		addSubview(headerStackView)
		headerStackView.addArrangedSubview(headerLabel)
		headerStackView.addArrangedSubview(topButton)
		
		NSLayoutConstraint.activate([
			headerStackView.topAnchor.constraint(equalTo: topAnchor),
			headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
}

