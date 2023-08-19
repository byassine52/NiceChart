//
//  Level.swift
//  NiceChart
//
//  Created by Yassine ElBadaoui on 2023/08/19.
//  Copyright © 2023 ElBadaoui Inc. All rights reserved.
//

import Foundation

/// Level.
struct Level: Identifiable {
	/// ID.
	let id = UUID()
	/// Duration.
	let milestone: Milestone
	/// Progress.
	let progress: Double
}

/// Mileston.
struct Milestone {
	let value: Int
	let unit: Unit
}

extension Milestone {
	/// Unit.
	enum Unit {
		case month
		case year
	}
}

extension Milestone {

	/// Duration string.
	var durationString: String {
		if value == 0 {
			return L10n.Home.Chart.present
		} else {
			let dateComponents: DateComponents
			switch unit {
			case .month:
				dateComponents = DateComponents(month: value)

			case .year:
				dateComponents = DateComponents(year: value)
			}
			let result = DateComponentsFormatter.durationFormatter.string(from: dateComponents)
			return result ?? L10n.Home.Chart.present
		}
	}

}
