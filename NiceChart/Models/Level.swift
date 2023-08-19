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
	var id = UUID()
	/// Milestone.
	var milestone: String
	/// Progress.
	var progress: Double
}
