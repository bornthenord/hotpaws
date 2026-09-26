//
//  SectionsOutlineDataSource.swift
//  HotPaws
//
//  Created by cat dog on 26.09.2026.
//

import Cocoa

struct RuleRow {
    let source: String
    let target: String
    let modifiers: String?
}

struct SectionRow {
    let name: String
    let rules: [RuleRow]
}

class SectionsDataSource: NSObject, NSOutlineViewDataSource, NSOutlineViewDelegate {
    private(set) var sections: [SectionRow] = []

    func reload(mapping: Mapping) {
        sections = mapping.rules.keys.sorted { $0.rawValue < $1.rawValue }.map { modifier in
            let rules = mapping.rules[modifier] ?? [:]
            let rows = rules.values.sorted { String(describing: $0.source.key) < String(describing: $1.source.key) }.map { rule in
                let modifiersText: String?
                if let modifiers = rule.modifiers, !modifiers.isEmpty {
                    modifiersText = modifiers.map { String(describing: $0.modifier) }.sorted().joined(separator: ",")
                } else {
                    modifiersText = nil
                }

                return RuleRow(
                    source: (rule.source.isDouble ? "2" : "") + String(describing: rule.source.key),
                    target: rule.target.name,
                    modifiers: modifiersText
                )
            }
            return SectionRow(name: String(describing: modifier), rules: rows)
        }
    }

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let section = item as? SectionRow {
            return section.rules.count
        }
        return sections.count
    }

    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let section = item as? SectionRow {
            return section.rules[index]
        }
        return sections[index]
    }

    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        item is SectionRow
    }

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let identifier = NSUserInterfaceItemIdentifier("cell")
        var cell = outlineView.makeView(withIdentifier: identifier, owner: self) as? NSTableCellView

        if cell == nil {
            cell = NSTableCellView()
            cell?.identifier = identifier

            let label = NSTextField(labelWithString: "")
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byTruncatingTail

            cell?.addSubview(label)
            cell?.textField = label

            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: cell!.leadingAnchor, constant: 4),
                label.trailingAnchor.constraint(equalTo: cell!.trailingAnchor, constant: -4),
                label.centerYAnchor.constraint(equalTo: cell!.centerYAnchor)
            ])
        }

        if let section = item as? SectionRow {
            cell?.textField?.stringValue = "[\(section.name)]"
            cell?.textField?.font = NSFont.monospacedSystemFont(ofSize: 13, weight: .semibold)
            cell?.textField?.textColor = NSColor.systemBlue
        } else if let rule = item as? RuleRow {
            var text = "\(rule.source) -> \(rule.target)"
            if let modifiers = rule.modifiers {
                text += " [\(modifiers)]"
            }
            cell?.textField?.stringValue = text
            cell?.textField?.font = NSFont.monospacedSystemFont(ofSize: 13, weight: .regular)
            cell?.textField?.textColor = NSColor.textColor
        }

        return cell
    }
}