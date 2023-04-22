//
//  TinkoffLeftIconCardView.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

public class TinkoffLeftIconCardView: UIView {

	private let contentView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.masksToBounds = true
		view.layer.cornerRadius = 24
		return view
	}()

	let itemView: TinkoffLeftIconItemView = {
		let view = TinkoffLeftIconItemView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	let cancelIconView: UIImageView = {
		let view = UIImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.contentMode = .scaleAspectFit
		view.image = UIImage(named: "closeIcon")
		view.isHidden = true
		return view
	}()

	public final var isCancellModeEnabled = false {
		didSet {
			cancelIconView.isHidden = !isCancellModeEnabled
		}
	}

	public var style: TinkoffViewStyle = .white {
		didSet {
			applyStyle()
		}
	}

	public weak var delegate: TinkoffCardViewDelegate?

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
		addSubview(itemView)
		addSubview(cancelIconView)
		setupLayout()
		applyStyle()
		cancelIconView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeTapped)))
	}

	public func set(item: ItemModel) {
		itemView.set(model: item)
	}

	func setupLayout() {
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: topAnchor),
			contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
			contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
			itemView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			itemView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
			itemView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			cancelIconView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			cancelIconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			cancelIconView.widthAnchor.constraint(equalToConstant: 24),
			cancelIconView.heightAnchor.constraint(equalToConstant: 24)
			])
	}
	
	internal func applyStyle() {
		contentView.backgroundColor = style.backgroudColor
	}

	@objc private func closeTapped() {
		delegate?.didtapCloseButton()
	}

	public override func layoutSubviews() {
		super.layoutSubviews()
		if style.isShadowVisible {
			dropShadow(color: .black, opacity: 0.12, offSet: .init(width: 0, height: 6), radius: 8)
		} else {
			removeShadow()
		}
	}
}
