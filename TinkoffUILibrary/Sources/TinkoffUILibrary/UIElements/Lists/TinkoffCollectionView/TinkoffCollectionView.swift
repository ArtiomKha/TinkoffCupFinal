//
//  TinkoffCollectionView.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

class TinkoffCollectionView: UIView {

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
		stackView.layoutMargins = UIEdgeInsets(top: 16, left: 0, bottom: 20, right: 0)
		stackView.isLayoutMarginsRelativeArrangement = true
		return stackView
	}()

	private let headerContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	internal let headerView: TinkoffListHeaderView = {
		let view = TinkoffListHeaderView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private let collectionViewLayout: UICollectionViewFlowLayout = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
		return layout
	}()

	internal lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)

	public var dataSource: [ItemModel] = [] {
		didSet {
			collectionView.reloadData()
		}
	}

	public weak var delegate: TinkoffListViewDelegate?

	public var headerTitle: String? {
		didSet {
			headerView.headerLabel.text = headerTitle
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

	internal func setup() {
		addSubview(contentView)
		addSubview(stackView)
		stackView.addArrangedSubview(headerContainer)
		headerContainer.addSubview(headerView)
		stackView.addArrangedSubview(collectionView)
		setupCollectionView()
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: topAnchor),
			contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
			contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			collectionView.heightAnchor.constraint(equalToConstant: 145),
			headerView.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: 20),
			headerView.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor, constant: -20),
			headerView.topAnchor.constraint(equalTo: headerContainer.topAnchor),
			headerView.bottomAnchor.constraint(equalTo: headerContainer.bottomAnchor)
		])
		
		headerView.topButton.addTarget(self, action: #selector(headerButtonTapped), for: .primaryActionTriggered)
	}

	private func setupCollectionView() {
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(TinkoffCollectionViewCell.self, forCellWithReuseIdentifier: TinkoffCollectionViewCell.identifier)
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.backgroundColor = .clear
	}

	@objc private func headerButtonTapped() {
		delegate?.didTapBarButton()
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		dropShadow(color: .black, opacity: 0.12, offSet: .init(width: 0, height: 6), radius: 8)
	}
}

extension TinkoffCollectionView: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		dataSource.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TinkoffCollectionViewCell.identifier, for: indexPath) as? TinkoffCollectionViewCell else {
			return UICollectionViewCell()
		}
		
		cell.set(item: dataSource[indexPath.row])
		
		return cell
	}
}

extension TinkoffCollectionView: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		delegate?.didSelectItem(at: indexPath.row)
	}
}

extension TinkoffCollectionView: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 140, height: 140)
	}

	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
			return 12
	}
}
