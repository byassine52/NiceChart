//
//  DateComponentsFormatter+Extensions.swift
//  NiceChart
//
//  Created by Yassine ElBadaoui on 2023/08/19.
//  Copyright © 2023 ElBadaoui Inc. All rights reserved.
//

import Foundation

extension DateComponentsFormatter {

	/// Duration formatter.
	static var durationFormatter: DateComponentsFormatter = {
		let formatter = DateComponentsFormatter()
		formatter.unitsStyle = .full
		return formatter
	}()

}
