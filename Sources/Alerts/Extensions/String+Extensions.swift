import UIKit

extension String {

    subscript (idx: Int) -> Character {
        return self[index(startIndex, offsetBy: idx)]
    }

    subscript (idx: Int) -> String {
        return String(self[idx] as Character)
    }

    subscript (range: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }

    var containsAlphabets: Bool {
        //Checks if all the characters inside the string are alphabets
        let set = CharacterSet.letters
        return self.utf16.contains {
            guard let unicode = UnicodeScalar($0) else { return false }
            return set.contains(unicode)
        }
    }
}

// MARK: - NSAttributedString extensions
extension String {

    /// Regular string.
    var regular: NSAttributedString {
        return NSMutableAttributedString(string: self,
                                         attributes: [.font: UIFont.systemFont(ofSize: UIFont.systemFontSize)])
    }

    /// Bold string.
    var bold: NSAttributedString {
        return NSMutableAttributedString(string: self,
                                         attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }

    /// Underlined string
    var underline: NSAttributedString {
        return NSAttributedString(string: self,
                                  attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }

    /// Strikethrough string.
    var strikethrough: NSAttributedString {
        let style = NSNumber(value: NSUnderlineStyle.single.rawValue as Int)
        return NSAttributedString(string: self,
                                  attributes: [.strikethroughStyle: style])
    }

    /// Italic string.
    var italic: NSAttributedString {
        return NSMutableAttributedString(string: self,
                                         attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }

    /// Add color to string.
    ///
    /// - Parameter color: text color.
    /// - Returns: a NSAttributedString versions of string colored with given color.
    func colored(with color: UIColor) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.foregroundColor: color])
    }
}

extension Array where Element: NSAttributedString {
    func joined(separator: NSAttributedString) -> NSAttributedString {
        var isFirst = true
        return self.reduce(NSMutableAttributedString()) { (result, element) in
            if isFirst {
                isFirst = false
            } else {
                result.append(separator)
            }
            result.append(element)
            return result
        }
    }

    func joined(separator: String) -> NSAttributedString {
        return joined(separator: NSAttributedString(string: separator))
    }
}
