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
    var leftIcon: String?
    var rightIcon: String?

    // MARK: Actions
    var action: (() -> Void)?

    // MARK: Render
    var body: some View {
        Button {
            action?()
        } label: {
            HStack {
                if let leftIcon = leftIcon {
                    Image(systemName: leftIcon)
                }
                if let title = title {
                    Text(title)
                }
                if let rightIcon = rightIcon {
                    Image(systemName: rightIcon)
                }
            }
        }
    }
}

struct StyledButton_Previews: PreviewProvider {
    static var previews: some View {
        StyledButton(title: "Done", leftIcon: "checkmark.circle")
    }
}
