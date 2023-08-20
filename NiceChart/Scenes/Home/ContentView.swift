//
//  ContentView.swift
//  NiceChart
//
//  Created by Yassine ElBadaoui on 2023/08/19.
//  Copyright © 2023 ElBadaoui Inc. All rights reserved.
//

import Charts
import SwiftUI

// - MARK: Main Layout

struct ContentView: View {

	/// View model.
	@ObservedObject var viewModel: ViewModel

	var body: some View {
		ScrollView {
			Spacer(minLength: 52)
			VStack(spacing: 30) {
				closeButton
				title
				chartSection
				bottomSection
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			Spacer(minLength: 54)
		}
		.scrollIndicators(.hidden)
		.padding(20)
		.background(
			LinearGradient(
				gradient: Gradient(colors: [
					Color(asset: Asset.backgroundGradientTop),
					Color(asset: Asset.backgroundGradientBottom),
				]),
				startPoint: .top,
				endPoint: .bottom
			)
		)
		.ignoresSafeArea()
	}
}

// - MARK: Screen Components

extension ContentView {
	/// Close button.
	var closeButton: some View {
		HStack {
			Spacer()
			Button("×") {}
				.buttonStyle(CloseButtonStyle())
		}
	}

	/// Title.
	var title: some View {
		Text(L10n.Home.title)
			.multilineTextAlignment(.center)
			.font(.system(size: 36, weight: .bold))
			.foregroundColor(Color(asset: Asset.text))
	}

	/// Chart section.
	var chartSection: some View {
		ZStack {
			chart
			image
		}
		.frame(maxWidth: 340)
	}

	/// Bottom section.
	var bottomSection: some View {
		VStack(spacing: 25) {
			VStack(spacing: 0) {
				bottomText
				gradientText
			}
			callToActionButton
		}
	}

	/// Image.
	var image: some View {
		VStack {
			HStack {
				Image(asset: Asset.protty)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(height: 160)
				Spacer()
			}
			Spacer()
		}
	}

	/// Chart.
	var chart: some View {
		VStack {
			Spacer(minLength: 52)
			HStack {
				Spacer()
				Chart {
					ForEach(viewModel.level) { level in
						BarMark(
							x: .value(L10n.Home.Chart.XAxis.label, level.milestone.durationString),
							y: .value(L10n.Home.Chart.YAxis.label, level.progress)
						)
					}
				}
				.chartXAxis {
					AxisMarks(values: .automatic) {
						AxisGridLine(centered: true, stroke: StrokeStyle(lineWidth: 0))
						AxisTick(stroke: StrokeStyle(lineWidth: 0))
						AxisValueLabel(anchor: .center)
							.font(.system(size: 12, weight: .bold))
							.foregroundStyle(Color(asset: Asset.text))
					}
				}
				.chartYAxis(.hidden)
				.frame(width: 270, height: 325)
				.foregroundStyle(
					LinearGradient(
						colors: [
							Color(asset: Asset.chartGradientTop),
							Color(asset: Asset.chartGradientBottom)
						],
						startPoint: .top,
						endPoint: .bottom
					)
				)
				Spacer()
			}
		}
	}

	/// Call to action button.
	var callToActionButton: some View {
		Button(L10n.Home.callToActionButtonText) {}
			.buttonStyle(CallToActionButtonStyle())
	}

	/// Bottom text.
	var bottomText: some View {
		Text(L10n.Home.bottomText)
			.multilineTextAlignment(.center)
			.font(.system(size: 20, weight: .semibold))
			.foregroundColor(Color(asset: Asset.text))
	}

	/// Gradient text.
	var gradientText: some View {
		Text(L10n.Home.gradientText)
			.font(.system(size: 30, weight: .bold))
			.tracking(-0.57)
			.multilineTextAlignment(.center)
			.foregroundStyle(
				LinearGradient(
					colors: [
						Color(asset: Asset.textGradientTop),
						Color(asset: Asset.textGradientBottom)
					],
					startPoint: .top,
					endPoint: .bottom
				)
			)
	}
}

// - MARK: Previews

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			ContentView(viewModel: .previewData)
				.previewDevices()
		}
	}
}
