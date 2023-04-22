//
//  Fonts.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

struct Colors {

	static let primary: UIColor = #colorLiteral(red: 0.2588235294, green: 0.5450980392, blue: 0.9764705882, alpha: 1)
	static let white = UIColor.white
	static let grey = #colorLiteral(red: 0.9647058824, green: 0.968627451, blue: 0.9725490196, alpha: 1)
	
	struct HorizontalCell {
		static let title: UIColor = #colorLiteral(red: 0.2605186105, green: 0.2605186105, blue: 0.2605186105, alpha: 1)
		static let subtitle: UIColor = #colorLiteral(red: 0.638805449, green: 0.6648148894, blue: 0.6958676577, alpha: 1)
	}

	struct List {
		static let header: UIColor = #colorLiteral(red: 0.2605186105, green: 0.2605186105, blue: 0.2605186105, alpha: 1)
	}

	struct CTAButton {
		static let title: UIColor = Colors.primary
		static let highlightedBackground = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.06)
		static let background = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
	}
}


struct Fonts {
	
	struct HorizontalCell {
		static let title = UIFont.systemFont(ofSize: 17)
		static let subtitle = UIFont.systemFont(ofSize: 14)
	}

	struct List {
		static let header: UIFont = .systemFont(ofSize: 20, weight: .bold)
		static let barButton = UIFont.systemFont(ofSize: 17)
	}

	struct CTAButton {
		static let title: UIFont = .systemFont(ofSize: 15)
	}
}
