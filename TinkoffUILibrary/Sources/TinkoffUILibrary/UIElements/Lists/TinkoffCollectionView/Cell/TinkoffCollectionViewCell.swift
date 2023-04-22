//
//  TinkoffCollectionViewCell.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

class TinkoffCollectionViewCell: UICollectionViewCell {

	static let identifier = "TinkoffCollectionViewCell"

	internal let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .leading
		stackView.distribution = .fill
		stackView.spacing = 38
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.layoutMargins = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
		stackView.isLayoutMarginsRelativeArrangement = true
		return stackView
	}()

	let titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 1
		label.font = Fonts.HorizontalCell.title
		label.textColor = Colors.HorizontalCell.title
		label.setContentHuggingPriority(.required, for: .vertical)
		label.textAlignment = .left
		return label
	}()

	let subtitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 1
		label.font = Fonts.HorizontalCell.subtitle
		label.textColor = Colors.HorizontalCell.title
		label.setContentHuggingPriority(.required, for: .vertical)
		label.textAlignment = .left
		return label
	}()

	let imageView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.contentMode = .scaleAspectFit
		return view
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
		contentView.addSubview(stackView)
		//TODO: - UPD
		contentView.backgroundColor = Colors.CTAButton.background
		contentView.layer.cornerRadius = 12
		stackView.addArrangedSubview(imageView)
		stackView.addArrangedSubview(titleLabel)
		stackView.setCustomSpacing(8, after: titleLabel)
		stackView.addArrangedSubview(subtitleLabel)

		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			imageView.widthAnchor.constraint(equalToConstant: 40),
			imageView.heightAnchor.constraint(equalToConstant: 40)
		])
	}

	func set(item: ItemModel) {
		imageView.image = item.image
		titleLabel.text = item.title
		subtitleLabel.text = item.subtitle
	}
}
