//
//  StyledButton.swift
//  SwiftUI-Styled
//
//  Created by const on 14.06.2023.
//

import SwiftUI

struct StyledButton: View {

    // MARK: Properties
    private let title: String?

    private let leftIcon: StyledIcon.Name?
    private let rightIcon: StyledIcon.Name?

    private let backgroundColor: Color
    private let foregroundColor: Color

    // MARK: Actions
    private let action: (() -> Void)?

    // MARK: Inits
    init(title: String? = nil,
         leftIcon: StyledIcon.Name? = nil,
         rightIcon: StyledIcon.Name? = nil,
         backgroundColor: Color = .clear,
         foregroundColor: Color = .blue,
         action: (() -> Void)? = nil) {
        self.title = title
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.backgroundColor = backgroundColor
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
    }
}

struct StyledButton_Previews: PreviewProvider {
    static var previews: some View {
        StyledButton(title: "Done",
                     leftIcon: .symbolName(.checkmark))
    }
}
