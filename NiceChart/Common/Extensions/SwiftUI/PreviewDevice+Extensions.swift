//
//  PreviewDevice+Extensions.swift
//  NiceChart
//
//  Created by Yassine ElBadaoui on 2023/08/19.
//  Copyright © 2023 ElBadaoui Inc. All rights reserved.
//

import SwiftUI

public extension PreviewDevice {
	/// Default preview devices. Can be changed as needed.
	static var selectedDevices: [Device] {
		[
			.iPhone_SE_1st_generation,
			// .iPhone_8,
			// .iPhone_8_Plus,
			.iPhone_14_Pro,
			.iPhone_14_Pro_Max,
			.iPad_mini_6th_generation,
			.iPad_Pro_11inch_4th_generation
		]
	}

	/// Enum that defines all preview devices supported by simulator
	/// Please consider auto-generating this Enum in a way similar to what is done with SwiftGen.
	enum Device: String, CaseIterable {
		case mac = "Mac"
		case iPhone_6s = "iPhone 6s"
		case iPhone_6s_Plus = "iPhone 6s Plus"
		case iPhone_SE_1st_generation = "iPhone SE (1st generation)"
		case iPhone_7 = "iPhone 7"
		case iPhone_7_Plus = "iPhone 7 Plus"
		case iPhone_8 = "iPhone 8"
		case iPhone_8_Plus = "iPhone 8 Plus"
		case iPhone_X = "iPhone X"
		case iPhone_Xs = "iPhone Xs"
		case iPhone_Xs_Max = "iPhone Xs Max"
		case iPhone_Xʀ = "iPhone Xʀ"
		case iPhone_11 = "iPhone 11"
		case iPhone_11_Pro = "iPhone 11 Pro"
		case iPhone_11_Pro_Max = "iPhone 11 Pro Max"
		case iPhone_SE_2nd_generation = "iPhone SE (2nd generation)"
		case iPhone_12_mini = "iPhone 12 mini"
		case iPhone_12 = "iPhone 12"
		case iPhone_12_Pro = "iPhone 12 Pro"
		case iPhone_12_Pro_Max = "iPhone 12 Pro Max"
		case iPhone_13_Pro = "iPhone 13 Pro"
		case iPhone_13_Pro_Max = "iPhone 13 Pro Max"
		case iPhone_13_mini = "iPhone 13 mini"
		case iPhone_13 = "iPhone 13"
		case iPhone_SE_3rd_generation = "iPhone SE (3rd generation)"
		case iPhone_14 = "iPhone 14"
		case iPhone_14_Plus = "iPhone 14 Plus"
		case iPhone_14_Pro = "iPhone 14 Pro"
		case iPhone_14_Pro_Max = "iPhone 14 Pro Max"
		case iPhone_15 = "iPhone 15"
		case iPhone_15_Plus = "iPhone 15 Plus"
		case iPhone_15_Pro = "iPhone 15 Pro"
		case iPhone_15_Pro_Max = "iPhone 15 Pro Max"
		case iPod_touch_7th_generation = "iPod touch (7th generation)"
		case iPad_mini_4 = "iPad mini 4"
		case iPad_Air_2 = "iPad Air 2"
		case iPad_Pro_9_7inch = "iPad Pro (9.7-inch)"
		case iPad_Pro_12_9inch_1st_generation = "iPad Pro (12.9-inch) (1st generation)"
		case iPad_5th_generation = "iPad (5th generation)"
		case iPad_Pro_12_9inch_2nd_generation = "iPad Pro (12.9-inch) (2nd generation)"
		case iPad_Pro_10_5inch = "iPad Pro (10.5-inch)"
		case iPad_6th_generation = "iPad (6th generation)"
		case iPad_7th_generation = "iPad (7th generation)"
		case iPad_Pro_11inch_1st_generation = "iPad Pro (11-inch) (1st generation)"
		case iPad_Pro_12_9inch_3rd_generation = "iPad Pro (12.9-inch) (3rd generation)"
		case iPad_Pro_11inch_2nd_generation = "iPad Pro (11-inch) (2nd generation)"
		case iPad_Pro_12_9inch_4th_generation = "iPad Pro (12.9-inch) (4th generation)"
		case iPad_mini_5th_generation = "iPad mini (5th generation)"
		case iPad_Air_3rd_generation = "iPad Air (3rd generation)"
		case iPad_8th_generation = "iPad (8th generation)"
		case iPad_9th_generation = "iPad (9th generation)"
		case iPad_Air_4th_generation = "iPad Air (4th generation)"
		case iPad_Pro_11inch_3rd_generation = "iPad Pro (11-inch) (3rd generation)"
		case iPad_Pro_12_9inch_5th_generation = "iPad Pro (12.9-inch) (5th generation)"
		case iPad_Air_5th_generation = "iPad Air (5th generation)"
		case iPad_10th_generation = "iPad (10th generation)"
		case iPad_mini_6th_generation = "iPad mini (6th generation)"
		case iPad_Pro_11inch_4th_generation = "iPad Pro (11-inch) (4th generation)"
		case iPad_Pro_11inch_4th_generation_16GB = "iPad Pro (11-inch) (4th generation) (16GB)"
		case iPad_Pro_12_9inch_6th_generation = "iPad Pro (12.9-inch) (6th generation)"
		case iPad_Pro_12_9inch_6th_generation_16GB = "iPad Pro (12.9-inch) (6th generation) (16GB)"
		case Apple_TV = "Apple TV"
		case Apple_TV_4K = "Apple TV 4K"
		case Apple_TV_4K_at_1080p = "Apple TV 4K (at 1080p)"
		case Apple_TV_4K_2nd_generation = "Apple TV 4K (2nd generation)"
		case Apple_TV_4K_2nd_generation_at_1080p = "Apple TV 4K (2nd generation) (at 1080p)"
		case Apple_TV_4K_3rd_generation = "Apple TV 4K (3rd generation)"
		case Apple_TV_4K_3rd_generation_at_1080p = "Apple TV 4K (3rd generation) (at 1080p)"
		case Apple_Watch_Series_2_38mm = "Apple Watch Series 2 (38mm)"
		case Apple_Watch_Series_2_42mm = "Apple Watch Series 2 (42mm)"
		case Apple_Watch_Series_3_38mm = "Apple Watch Series 3 (38mm)"
		case Apple_Watch_Series_3_42mm = "Apple Watch Series 3 (42mm)"
		case Apple_Watch_Series_4_40mm = "Apple Watch Series 4 (40mm)"
		case Apple_Watch_Series_4_44mm = "Apple Watch Series 4 (44mm)"
		case Apple_Watch_Series_5_40mm = "Apple Watch Series 5 (40mm)"
		case Apple_Watch_Series_5_44mm = "Apple Watch Series 5 (44mm)"
		case Apple_Watch_SE_40mm = "Apple Watch SE (40mm)"
		case Apple_Watch_SE_44mm = "Apple Watch SE (44mm)"
		case Apple_Watch_Series_6_40mm = "Apple Watch Series 6 (40mm)"
		case Apple_Watch_Series_6_44mm = "Apple Watch Series 6 (44mm)"
		case Apple_Watch_Series_7_41mm = "Apple Watch Series 7 (41mm)"
		case Apple_Watch_Series_7_45mm = "Apple Watch Series 7 (45mm)"
		case Apple_Watch_SE_40mm_2nd_generation = "Apple Watch SE (40mm) (2nd generation)"
		case Apple_Watch_SE_44mm_2nd_generation = "Apple Watch SE (44mm) (2nd generation)"
		case Apple_Watch_Series_8_41mm = "Apple Watch Series 8 (41mm)"
		case Apple_Watch_Series_8_45mm = "Apple Watch Series 8 (45mm)"
		case Apple_Watch_Ultra_49mm = "Apple Watch Ultra (49mm)"
		case Apple_Watch_Series_9_41mm = "Apple Watch Series 9 (41mm)"
		case Apple_Watch_Series_9_45mm = "Apple Watch Series 9 (45mm)"
		case Apple_Watch_Ultra_2_49mm = "Apple Watch Ultra 2 (49mm)"
		case Apple_Vision_Pro = "Apple Vision Pro"
	}
}
