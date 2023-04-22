//
//  ViewController.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit
import TinkoffUILibrary

class ViewController: UIViewController {

	let scroll: UIScrollView = {
		let scroll = UIScrollView()
		scroll.translatesAutoresizingMaskIntoConstraints = false
		return scroll
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

	let collectionView: TinkoffCollectionView = {
		let view = TinkoffCollectionView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.headerTitle = "Header"
		view.dataSource = Array(repeating: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "Subtitle"), count: 5)
		view.headerButtonTitle = "Button"
		return view
	}()

	let collectionViewButton: TinkoffCollectionWithButtonView = {
		let view = TinkoffCollectionWithButtonView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.headerTitle = "Header"
		view.buttonTitle = "Button"
		view.dataSource = Array(repeating: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "Subtitle"), count: 5)
		view.headerButtonTitle = "Button"
		return view
	}()

	let listView: TinkoffListView = {
		let view = TinkoffListView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .white
		view.headerTitle = "Header"
		view.dataSource = Array(repeating: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "Subtitle"), count: 5)
		view.headerButtonTitle = "Button"
		return view
	}()

	let greyListView: TinkoffListView = {
		let view = TinkoffListView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .grey
		view.headerTitle = "Header"
		view.dataSource = Array(repeating: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "Subtitle"), count: 5)
		view.headerButtonTitle = "Button"
		return view
	}()

	let listButtonView: TinkoffListView = {
		let view = TinkoffListButtonView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .white
		view.headerTitle = "Header"
		view.dataSource = Array(repeating: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "Subtitle"), count: 5)
		view.headerButtonTitle = "Button"
		return view
	}()

	let greyListButtonView: TinkoffListView = {
		let view = TinkoffListButtonView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .grey
		view.headerTitle = "Very long header"
		view.dataSource = Array(repeating: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "Subtitle"), count: 5)
		view.headerButtonTitle = "Button Button Button"
		return view
	}()

	let button: TinkoffButton = {
		let button = TinkoffButton()
		button.setTitle("Button", for: .normal)
		return button
	}()
	
	let buttonHigh: TinkoffButton = {
		let button = TinkoffButton()
		button.setTitle("Button", for: .normal)
		button.isHighlighted = true
		return button
	}()

	let cardView: TinkoffCardView = {
		let view = TinkoffCardView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .white
		view.set(item: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: nil))
		return view
	}()
	
	let cardView2: TinkoffCardView = {
		let view = TinkoffCardView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .grey
		view.set(item: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: nil))
		return view
	}()
	
	let cardView3: TinkoffCardView = {
		let view = TinkoffCardView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .white
		view.set(item: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "subtitle"))
		return view
	}()
	
	let cardView4: TinkoffCardView = {
		let view = TinkoffCardView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .grey
		view.set(item: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "subtitle"))
		return view
	}()
	
	let cardView5: TinkoffCardView = {
		let view = TinkoffButtonCardView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .grey
		view.set(item: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "subtitle"))
		view.buttonTitle = "Button"
		return view
	}()
	
	let cardView6: TinkoffCardView = {
		let view = TinkoffButtonCardView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .white
		view.set(item: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "subtitle"))
		view.buttonTitle = "Button"
		return view
	}()

	let leftCard: TinkoffLeftIconCardView = {
		let view = TinkoffLeftIconCardView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .white
		view.set(item: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "subtitle"))
		return view
	}()
	
	let leftCard1: TinkoffLeftIconCardView = {
		let view = TinkoffLeftIconCardView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .grey
		view.set(item: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "subtitle"))
		return view
	}()

	let leftCard2: TinkoffLeftIconCardView = {
		let view = TinkoffLeftIconCardView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.style = .white
		view.isCancellModeEnabled = true
		view.set(item: ItemModel(image: UIImage(named: "tui-avatar"), title: "Title", subtitle: "subtitle"))
		return view
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupPreview()
	}

	func setupPreview() {
		view.backgroundColor = .white
		view.addSubview(scroll)
		NSLayoutConstraint.activate([
			scroll.topAnchor.constraint(equalTo: view.topAnchor),
			scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
		
		scroll.addSubview(stackView)
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: scroll.topAnchor),
			stackView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
			stackView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
			stackView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
			stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
		])
		
		stackView.addArrangedSubview(collectionView)
		stackView.addArrangedSubview(collectionViewButton)
		
		stackView.addArrangedSubview(listView)
		stackView.addArrangedSubview(greyListView)
		stackView.addArrangedSubview(listButtonView)
		stackView.addArrangedSubview(greyListButtonView)
		
		stackView.addArrangedSubview(button)
		stackView.addArrangedSubview(buttonHigh)
		
		NSLayoutConstraint.activate([
			button.heightAnchor.constraint(equalToConstant: 44),
			buttonHigh.heightAnchor.constraint(equalToConstant: 44)
		])
		
		[cardView, cardView2, cardView3, cardView4, cardView5, cardView6].forEach {
			stackView.addArrangedSubview($0)
		}
		
		[leftCard, leftCard1, leftCard2].forEach {
			stackView.addArrangedSubview($0)
		}

	}
}

