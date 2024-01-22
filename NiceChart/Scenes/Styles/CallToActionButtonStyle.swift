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
			.foregroundColor(Color.appWhite)
			.background(Color.appBlue)
			.clipShape(Capsule())
			.overlay(
				Capsule()
					.stroke(Color.appWhite, lineWidth: 1)
			)
			.shadow(color: Color.buttonShadow, radius: 10, x: 0, y: 2)
	}

}

/// Close button Style.
struct CloseButtonStyle: ButtonStyle {

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.font(.system(size: 20, weight: .bold))
			.foregroundColor(Color.text)
			.padding(12)
			.background(Color.appWhite)
			.clipShape(Circle())
			.overlay(
				Circle()
					.stroke(Color.appWhite, lineWidth: 1)
			)
			.shadow(color: Color.closeButtonShadow, radius: 10, x: 0, y: 2)
	}

}
