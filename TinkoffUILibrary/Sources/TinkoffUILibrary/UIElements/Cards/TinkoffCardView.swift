//
//  TinkoffCard.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

public class TinkoffCardView: UIView {

	private let contentView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.masksToBounds = true
		view.layer.cornerRadius = 24
		return view
	}()

	internal let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.spacing = 14
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.layoutMargins = UIEdgeInsets(top: 16, left: 20, bottom: 16, right: 16)
		stackView.isLayoutMarginsRelativeArrangement = true
		return stackView
	}()
	
	internal let headerStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.alignment = .firstBaseline // center
		stackView.distribution = .fill
		stackView.spacing = 16
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	internal let labelsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .equalSpacing
		stackView.spacing = 8
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

	let subheaderLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 1
		label.font = Fonts.HorizontalCell.subtitle
		label.textColor = Colors.HorizontalCell.subtitle
		label.setContentHuggingPriority(.required, for: .vertical)
		label.textAlignment = .left
		label.text = "Subheader"
		return label
	}()

	let imageView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.contentMode = .scaleAspectFit
		return view
	}()

	public weak var delegate: TinkoffCardViewDelegate?

	public var style: TinkoffViewStyle = .white {
		didSet {
			applyStyle()
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
		addSubview(contentView)
		addSubview(stackView)
		stackView.addArrangedSubview(headerStackView)
		headerStackView.addArrangedSubview(labelsStackView)
		headerStackView.addArrangedSpacerView()
		headerStackView.addArrangedSubview(imageView)
		labelsStackView.addArrangedSubview(headerLabel)
		labelsStackView.addArrangedSubview(subheaderLabel)
		
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: topAnchor),
			contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
			contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			imageView.widthAnchor.constraint(equalToConstant: 40),
			imageView.heightAnchor.constraint(equalToConstant: 40)
		])
		
		applyStyle()
	}

	internal func applyStyle() {
		contentView.backgroundColor = style.backgroudColor
	}

	public override func layoutSubviews() {
		super.layoutSubviews()
		if style.isShadowVisible {
			dropShadow(color: .black, opacity: 0.12, offSet: .init(width: 0, height: 6), radius: 8)
		} else {
			removeShadow()
		}
	}

	public func set(item: ItemModel) {
		imageView.image = item.image
		subheaderLabel.text = item.subtitle
		headerLabel.text = item.title
		headerStackView.alignment = item.subtitle == nil ? .center : .firstBaseline
		subheaderLabel.isHidden = item.subtitle == nil
	}
}
