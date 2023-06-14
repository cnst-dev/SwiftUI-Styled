//
//  StyledIcon.swift
//  SwiftUI-Styled
//
//  Created by const on 14.06.2023.
//

import SwiftUI

struct StyledIcon: View {

    enum NameType {
        case systemName(String)
        case assetName(String)
    }

    let type: NameType

    var body: some View {
        switch type {
        case .systemName(let name):
            return Image(systemName: name)
        case .assetName(let name):
            return Image(name)
        }
    }
}

struct StyledIcon_Previews: PreviewProvider {
    static var previews: some View {
        StyledIcon(type: .systemName("bookmark"))
    }
}
