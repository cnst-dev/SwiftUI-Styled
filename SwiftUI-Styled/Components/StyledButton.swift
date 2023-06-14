//
//  StyledButton.swift
//  SwiftUI-Styled
//
//  Created by const on 14.06.2023.
//

import SwiftUI

struct StyledButton: View {

    // MARK: Properties
    var title: String?
    var leftIcon: StyledIcon.Name?
    var rightIcon: StyledIcon.Name?

    // MARK: Actions
    var action: (() -> Void)?

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
    }
}

struct StyledButton_Previews: PreviewProvider {
    static var previews: some View {
        StyledButton(title: "Done",
                     leftIcon: .symbolName(.checkmark))
    }
}
