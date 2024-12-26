//
//  LibraryView.swift
//  medusa
//
//  Created by Zheer Barzan on 26/12/24.
//

import SwiftUI

struct LibraryView: View {
    @StateObject var libraryViewModel = LibraryViewModel()
    var body: some View {
        Text("Library")
            .font(.system(.title, design: .monospaced))
            .foregroundColor(.black)

    }
}

#Preview {
    LibraryView()
}
