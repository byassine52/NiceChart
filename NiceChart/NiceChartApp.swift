//
//  NiceChartApp.swift
//  NiceChart
//
//  Created by Yassine ElBadaoui on 2023/08/19.
//  Copyright © 2023 ElBadaoui Inc. All rights reserved.
//

import SwiftUI

@main
struct NiceChartApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView(viewModel: .previewData)
		}
	}
}
