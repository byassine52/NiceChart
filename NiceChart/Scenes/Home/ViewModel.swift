//
//  ViewModel.swift
//  NiceChart
//
//  Created by Yassine ElBadaoui on 2023/08/19.
//  Copyright © 2023 ElBadaoui Inc. All rights reserved.
//

import SwiftUI

/// View model.
class ViewModel: ObservableObject {
	/// Level data.
	@Published var level: [Level]

	/// Initialize view model.
	/// - Parameter level: Level.
	required init(level: [Level]) {
		self.level = level
	}
}

extension ViewModel {
	/// Levels
	static var levels = [
		Level(milestone: Milestone(value: 0, unit: .month), progress: 66),
		Level(milestone: Milestone(value: 3, unit: .month), progress: 100),
		Level(milestone: Milestone(value: 1, unit: .year), progress: 220),
		Level(milestone: Milestone(value: 2, unit: .year), progress: 300),
	]

	/// Preview fata.
	static var previewData = ViewModel(level: levels)
}
