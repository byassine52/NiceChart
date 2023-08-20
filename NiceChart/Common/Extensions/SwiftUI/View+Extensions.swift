//
//  View+Extensions.swift
//  NiceChart
//
//  Created by Yassine ElBadaoui on 2023/08/19.
//  Copyright © 2023 ElBadaoui Inc. All rights reserved.
//

import SwiftUI

extension View {
	/// Preview in specific device preview.
	/// - Parameter device: Device name.
	/// - Returns: Selected device preview.
	func preview(device: PreviewDevice.Device) -> some View {
		previewDevice(PreviewDevice(rawValue: device.rawValue))
			.previewDisplayName(device.rawValue)
	}

	/// Preview in multiple device previews. If not specified previews are returned for `PreviewDevice.selectedDevices`.
	/// - Parameter devices: Device array.
	/// - Returns: Multiple previews.
	func previewSelectedDevices(_ devices: [PreviewDevice.Device] = PreviewDevice.selectedDevices) -> some View {
		ForEach(devices, id: \.self) { device in
			preview(device: device)
		}
	}
}
