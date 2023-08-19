// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Home {
    /// スピークバディで
    public static let bottomText = L10n.tr("Localizable", "home.bottomText", fallback: "スピークバディで")
    /// プランに登録する
    public static let callToActionButtonText = L10n.tr("Localizable", "home.callToActionButtonText", fallback: "プランに登録する")
    /// レベルアップ
    public static let gradientText = L10n.tr("Localizable", "home.gradientText", fallback: "レベルアップ")
    /// Localizable.strings
    ///   NiceChart
    /// 
    ///   Created by Yassine ElBadaoui on 2023/08/19.
    ///   Copyright © 2023 ElBadaoui Inc. All rights reserved.
    public static let title = L10n.tr("Localizable", "home.title", fallback: "Hello\nSpeakBUDDY")
    public enum Chart {
      /// 1年
      public static let oneyear = L10n.tr("Localizable", "home.chart.oneyear", fallback: "1年")
      /// 現在
      public static let present = L10n.tr("Localizable", "home.chart.present", fallback: "現在")
      /// 3ヶ月
      public static let threeMonths = L10n.tr("Localizable", "home.chart.threeMonths", fallback: "3ヶ月")
      /// 2年
      public static let twoYears = L10n.tr("Localizable", "home.chart.twoYears", fallback: "2年")
      public enum XAxis {
        /// マイルストーン
        public static let label = L10n.tr("Localizable", "home.chart.xAxis.label", fallback: "マイルストーン")
      }
      public enum YAxis {
        /// 進捗度
        public static let label = L10n.tr("Localizable", "home.chart.yAxis.label", fallback: "進捗度")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
