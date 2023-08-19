//
//  BlueButtonStyle.swift
//  NiceChart
//
//  Created by Yassine ElBadaoui on 2023/08/19.
//  Copyright © 2023 ElBadaoui Inc. All rights reserved.
//

import SwiftUI

/// Call to action button Style.
struct CallToActionButtonStyle: ButtonStyle {

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.padding(.vertical, 16)
			.padding(.horizontal, 16)
			.frame(minWidth: 350, minHeight: 56)
			.fontWeight(.bold)
			.lineLimit(1)
			.foregroundColor(Color(asset: Asset.appWhite))
			.background(Color(asset: Asset.appBlue))
			.clipShape(Capsule())
			.overlay(
				Capsule()
					.stroke(Color(asset: Asset.appWhite), lineWidth: 1)
			)
			.shadow(color: Color(asset: Asset.buttonShadow), radius: 10, x: 0, y: 2)
	}

}

/// Close button Style.
struct CloseButtonStyle: ButtonStyle {

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.font(.system(size: 20, weight: .bold))
			.foregroundColor(Color(asset: Asset.text))
			.padding(12)
			.background(Color(asset: Asset.appWhite))
			.clipShape(Circle())
			.overlay(
				Circle()
					.stroke(Color(asset: Asset.appWhite), lineWidth: 1)
			)
			.shadow(color: Color(asset: Asset.closeButtonShadow), radius: 10, x: 0, y: 2)
	}

}
