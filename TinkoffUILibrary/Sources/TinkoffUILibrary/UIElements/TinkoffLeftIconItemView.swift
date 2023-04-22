//
//  TinkoffHorizontalCellView.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

public class TinkoffLeftIconItemView: UIView {

	internal let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.alignment = .center
		stackView.distribution = .fill
		stackView.spacing = 16
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	internal let labelsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.spacing = 8
		stackView.translatesAutoresizingMaskIntoConstraints = false
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
		label.textColor = Colors.HorizontalCell.subtitle
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

	private func setup() {
		addSubview(stackView)
		stackView.addArrangedSubview(imageView)
		stackView.addArrangedSubview(labelsStackView)
		labelsStackView.addArrangedSubview(titleLabel)
		labelsStackView.addArrangedSubview(subtitleLabel)
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			imageView.widthAnchor.constraint(equalToConstant: 40),
			imageView.heightAnchor.constraint(equalToConstant: 40)
		])
	}

	func set(image: UIImage?, title: String?, subtitle: String?) {
		imageView.image = image
		titleLabel.text = title
		subtitleLabel.text = subtitle
	}

	func set(model: ItemModel) {
		imageView.image = model.image
		titleLabel.text = model.title
		subtitleLabel.text = model.subtitle
	}
}

public struct ItemModel {
	let image: UIImage?
	let title: String?
	let subtitle: String?
}
