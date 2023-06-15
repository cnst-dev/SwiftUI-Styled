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

    let foregroundColor: Color

    let style: ButtonStyle

    // MARK: Actions
    let action: (() -> Void)?

    // MARK: Inits
    init(title: String? = nil,
         leftIcon: StyledIcon.Name? = nil,
         rightIcon: StyledIcon.Name? = nil,
         background: Background = .clear,
         foregroundColor: Color = .blue,
         action: (() -> Void)? = nil) {
        self.title = title

        self.leftIcon = leftIcon
        self.rightIcon = rightIcon

        self.style = background.styles

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
        .background(style.background)
        .foregroundColor(foregroundColor)
        .cornerRadius(style.radius)
        .overlay(RoundedRectangle(cornerRadius: style.radius)
            .strokeBorder(lineWidth: style.stroke.width)
            .foregroundColor(style.stroke.color)
        )
    }
}

// MARK: Types
extension StyledButton {

    enum Background {

        case fill(color: Color, radius: CGFloat),
             stroke(color: Color, width: CGFloat, radius: CGFloat),
             clear

        var styles: ButtonStyle {
            switch self {
            case .stroke(color: let color, width: let width, radius: let radius):
                return ButtonStyle(background: .clear, stroke: (color, width), radius: radius)
            case .fill(color: let color, radius: let radius):
                return ButtonStyle(background: color, stroke: (color: .clear, width: 0), radius: radius)
            case .clear:
                return ButtonStyle(background: .clear, stroke: (color: .clear, width: 0), radius: 0)
            }
        }
    }
}

struct StyledButton_Previews: PreviewProvider {
    static var previews: some View {
        StyledButton(title: "Done",
                     leftIcon: .symbolName(.checkmark),
                     background: .stroke(color: .green, width: 2, radius: 10),
                     foregroundColor: .green)
    }
}
