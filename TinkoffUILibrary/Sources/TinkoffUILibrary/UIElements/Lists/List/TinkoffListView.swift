//
//  TinkoffListView.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

public class TinkoffListView: UIView {

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
		stackView.spacing = 20
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.layoutMargins = UIEdgeInsets(top: 16, left: 20, bottom: 20, right: 20)
		stackView.isLayoutMarginsRelativeArrangement = true
		return stackView
	}()

	internal let headerView: TinkoffListHeaderView = {
		let view = TinkoffListHeaderView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	internal let cellsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.spacing = 20
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	public var dataSource: [ItemModel] = [] {
		didSet {
			reloadData()
		}
	}

	private var cells: [TinkoffLeftIconItemView] = []

	public var style: TinkoffViewStyle = .white {
		didSet {
			applyStyle()
		}
	}

	public var headerTitle: String? {
		didSet {
			headerView.headerLabel.text = headerTitle
		}
	}

	public weak var delegate: TinkoffListViewDelegate?

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
		addSubview(contentView)
		addSubview(stackView)
		stackView.addArrangedSubview(headerView)
		stackView.addArrangedSubview(cellsStackView)
		
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: topAnchor),
			contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
			contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
		headerView.topButton.addTarget(self, action: #selector(headerButtonTapped), for: .primaryActionTriggered)
		applyStyle()
	}

	private func reloadData() {
		cellsStackView.removeAllArrangedSubviews()
		cells.removeAll()
		dataSource.enumerated().forEach { (index, model) in
			let cell = TinkoffLeftIconItemView()
			cell.translatesAutoresizingMaskIntoConstraints = false
			cell.set(model: model)
			cell.tag = index
			cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:))))
			cellsStackView.addArrangedSubview(cell)
		}
		layoutSubviews()
	}

	internal func applyStyle() {
		contentView.backgroundColor = style.backgroudColor
	}

	@objc private func headerButtonTapped() {
		delegate?.didTapBarButton()
	}

	@objc private func cellTapped(_ sender: UITapGestureRecognizer?) {
		if let sender, let tag = sender.view?.tag {
			delegate?.didSelectItem(at: tag)
		}
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
