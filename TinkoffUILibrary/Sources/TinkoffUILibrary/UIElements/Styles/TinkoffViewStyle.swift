//
//  TinkoffViewStyle.swift
//  TinkoffDemoApp
//
//  Created by Artsiom Khaliliayeu on 22.04.23.
//

import UIKit

public enum TinkoffViewStyle {
	case white
	case grey

	var backgroudColor: UIColor {
		switch self {
		case .white:
			return Colors.white
		case .grey:
			return Colors.grey
		}
	}

	var isShadowVisible: Bool {
		switch self {
		case .white:
			return true
		case .grey:
			return false
		}
	}
}

