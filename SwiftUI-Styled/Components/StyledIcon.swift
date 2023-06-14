//
//  StyledIcon.swift
//  SwiftUI-Styled
//
//  Created by const on 14.06.2023.
//

import SwiftUI

struct StyledIcon: View {

    // MARK: Nested
    enum Name {
        case symbolName(SFSymbol)
        case assetName(Assets)
    }

    // MARK: Properties
    let name: Name

    // MARK: Render
    var body: some View {
        switch name {
        case .symbolName(let name):
            return Image(systemName: name.rawValue)
        case .assetName(let name):
            return Image(name.rawValue)
        }
    }
}

struct StyledIcon_Previews: PreviewProvider {
    static var previews: some View {
        StyledIcon(name: .assetName(.xmark))
    }
}
