//
//  IniHighlighter.swift
//  HotPaws
//
//  Created by cat dog on 26.09.2026.
//

import Cocoa

struct IniHighlighter {
    static let fontSize: CGFloat = 14

    static func highlight(_ text: String) -> NSAttributedString {
        let attributed = NSMutableAttributedString(string: text)
        let nsText = text as NSString
        let wholeRange = NSRange(location: 0, length: nsText.length)

        attributed.addAttribute(.font, value: NSFont.monospacedSystemFont(ofSize: fontSize, weight: .regular), range: wholeRange)
        attributed.addAttribute(.foregroundColor, value: NSColor.textColor, range: wholeRange)

        nsText.enumerateSubstrings(in: wholeRange, options: [.byLines, .substringNotRequired]) { _, range, _, _ in
            let line = nsText.substring(with: range)
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)

            if trimmed.hasPrefix("#") {
                attributed.addAttribute(.foregroundColor, value: NSColor.secondaryLabelColor, range: range)
            } else if trimmed.hasPrefix("[") && trimmed.hasSuffix("]") {
                attributed.addAttribute(.foregroundColor, value: NSColor.systemBlue, range: range)
                attributed.addAttribute(.font, value: NSFont.monospacedSystemFont(ofSize: fontSize, weight: .semibold), range: range)
            } else if !trimmed.isEmpty {
                if let separator = line.firstIndex(of: ":") {
                    let keyLength = line.distance(from: line.startIndex, to: separator)
                    let keyRange = NSRange(location: range.location, length: keyLength)
                    attributed.addAttribute(.foregroundColor, value: NSColor.systemGreen, range: keyRange)
                }
            }
        }

        return attributed
    }
}