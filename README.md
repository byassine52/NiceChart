# NiceChart
Implementation of a nice chart using SwiftUI and Swift Charts.

To have expected results, please run with system language set to Japanese, or set scheme setting's "Run > Options > App Language" to Japanese.

## Remarks
1. I tried to have pixel perfect for the designs as much as possible, but display result might differ slightly depending on the device
2. Xcode uses Tab indentation
3. Xcode project uses [SwiftLint](https://github.com/realm/SwiftLint) to keep consistent coding style and formatting. Building will still work even if you don't have it installed at system level, but you'll get a compilation warning.
4. Xcode project uses [SwiftGen](https://github.com/SwiftGen/SwiftGen) to manage assets and localizations. Building will still work even if you don't have it installed at system level, but you'll get a compilation warning.
5. Although not requested, the whole app is internationalized, and localized to 3 languages (Japanese, English, Arabic)
6. Chart display is data driven, and uses formatter to format X axis values, thus you'll see in Japanese version "3か月" instead of "3ヶ月"

# Todo
1. Use [XcodeGen](https://github.com/yonaskolb/XcodeGen) to help avoiding merge conflicts on Xcode project when working in a team
