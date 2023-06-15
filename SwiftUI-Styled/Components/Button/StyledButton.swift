//
//  StyledButton.swift
//  SwiftUI-Styled
//
//  Created by const on 14.06.2023.
//

import SwiftUI

struct StyledButton: View {

    // MARK: Properties
    let title: String?

    let leftIcon: StyledIcon.Name?
    let rightIcon: StyledIcon.Name?

    let background: Background?
    let foregroundColor: Color

    private var backgroundColor: Color {
        guard case let .fill(color) = background else {
            return .clear
        }
        return color
    }

    private var stroke: (color: Color, width: CGFloat) {
        guard case let .stroke(color, width) = background else {
            return (.clear, 0)
        }
        return (color, width)
    }

    // MARK: Actions
    let action: (() -> Void)?

    // MARK: Inits
    init(title: String? = nil,
         leftIcon: StyledIcon.Name? = nil,
         rightIcon: StyledIcon.Name? = nil,
         background: Background? = nil,
         foregroundColor: Color = .blue,
         action: (() -> Void)? = nil) {
        self.title = title

        self.leftIcon = leftIcon
        self.rightIcon = rightIcon

        self.background = background
        self.foregroundColor = foregroundColor

        self.action = action
    }

    // MARK: Render
    var body: some View {
        Button {
            action?()
        } label: {
            HStack {
                if let leftIcon = leftIcon {
                    StyledIcon(name: leftIcon)
                }
                if let title = title {
                    Text(title)
                }
                if let rightIcon = rightIcon {
                    StyledIcon(name: rightIcon)
                }
            }
        }
        .padding()
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
            .strokeBorder(lineWidth: stroke.width)
            .foregroundColor(stroke.color)
        )

    }
}

// MARK: Types
extension StyledButton {
    enum Background {
        case fill(Color), stroke(Color, width: CGFloat)
    }
}

struct StyledButton_Previews: PreviewProvider {
    static var previews: some View {
        StyledButton(title: "Done",
                     leftIcon: .symbolName(.checkmark),
                     background: .stroke(.blue, width: 2),
                     foregroundColor: .blue)
    }
}
