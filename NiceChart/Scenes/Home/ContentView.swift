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
		.background(background)
		.ignoresSafeArea()
	}
}

// - MARK: Screen Components

extension ContentView {

	/// Close button.
	var background: some View {
		LinearGradient(
			gradient: Gradient(colors: [
				Color.backgroundGradientTop,
				Color.backgroundGradientBottom
			]),
			startPoint: .top,
			endPoint: .bottom
		)
	}
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
		Text("home.title")
			.multilineTextAlignment(.center)
			.font(.system(size: 36, weight: .bold))
			.foregroundColor(Color.text)
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
				Image(.protty)
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
							x: .value("home.Chart.XAxis.label", level.milestone.durationString),
							y: .value("home.Chart.YAxis.label", level.progress)
						)
					}
				}
				.chartXAxis {
					AxisMarks(values: .automatic) {
						AxisGridLine(centered: true, stroke: StrokeStyle(lineWidth: 0))
						AxisTick(stroke: StrokeStyle(lineWidth: 0))
						AxisValueLabel(anchor: .center)
							.font(.system(size: 12, weight: .bold))
							.foregroundStyle(Color.text)
					}
				}
				.chartYAxis(.hidden)
				.frame(width: 270, height: 325)
				.foregroundStyle(
					LinearGradient(
						colors: [
							Color.chartGradientTop,
							Color.chartGradientBottom
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
		Button("home.callToActionButtonText") {}
			.buttonStyle(CallToActionButtonStyle())
	}

	/// Bottom text.
	var bottomText: some View {
		Text("home.bottomText")
			.multilineTextAlignment(.center)
			.font(.system(size: 20, weight: .semibold))
			.foregroundColor(Color.text)
	}

	/// Gradient text.
	var gradientText: some View {
		Text("home.gradientText")
			.font(.system(size: 30, weight: .bold))
			.tracking(-0.57)
			.multilineTextAlignment(.center)
			.foregroundStyle(
				LinearGradient(
					colors: [
						Color.textGradientTop,
						Color.textGradientBottom
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
		ContentView(viewModel: .previewData)
			.previewSelectedDevices()
	}
}
