//
//  CameraView.swift
//  medusa
//
//  Created by Zheer Barzan on 26/12/24.
//

import SwiftUI

struct CameraView: View {
    @StateObject var cameraViewModel = CameraViewModel()
    
    var body: some View {
        Text("Camera")
            .font(.system(.title, design: .monospaced))
            .foregroundColor(.black)

    }
}

#Preview {
    CameraView()
}
