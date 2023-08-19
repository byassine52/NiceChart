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
		Level(milestone: "現在", progress: 66),
		Level(milestone: "3ヶ月", progress: 100),
		Level(milestone: "1年", progress: 220),
		Level(milestone: "2年", progress: 300),
	]

	/// Preview fata.
	static var previewData = ViewModel(level: levels)
}
