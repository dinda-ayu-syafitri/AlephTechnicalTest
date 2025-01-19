//
//  LoadingIndicatorView.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 20/01/25.
//

import SwiftUI

struct LoadingIndicatorView: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 50)
                    .fill(.accentBlue)
                    .phaseAnimator([true, false]) {
                        content, phase in
                        content
                            .opacity(phase ? 0.75 : 1)
                            .frame(width: 20, height: phase ? 100 : 20)
                    } animation: { _ in
                        .easeInOut(duration: 1.5)
                    }

                RoundedRectangle(cornerRadius: 50)
                    .fill(.accentOrange)
                    .phaseAnimator([true, false]) {
                        content, phase in
                        content
                            .opacity(phase ? 0.75 : 1)
                            .frame(width: 20, height: phase ? 10 : 70)
                    } animation: { _ in
                        .easeInOut(duration: 1.5)
                    }

                RoundedRectangle(cornerRadius: 50)
                    .fill(.accentBlue)
                    .phaseAnimator([true, false]) {
                        content, phase in
                        content
                            .opacity(phase ? 0.75 : 1)
                            .frame(width: 20, height: phase ? 50 : 10)
                    } animation: { _ in
                        .easeInOut(duration: 1.5)
                    }

                RoundedRectangle(cornerRadius: 50)
                    .fill(.accentBlue)
                    .phaseAnimator([true, false]) {
                        content, phase in
                        content
                            .opacity(phase ? 0.75 : 1)
                            .frame(width: 20, height: phase ? 20 : 80)
                    } animation: { _ in
                        .easeInOut(duration: 1.5)
                    }

                RoundedRectangle(cornerRadius: 50)
                    .fill(.accentBlue)
                    .phaseAnimator([true, false]) {
                        content, phase in
                        content
                            .opacity(phase ? 0.75 : 1)
                            .frame(width: 20, height: phase ? 100 : 30)
                    } animation: { _ in
                        .easeInOut(duration: 1.5)
                    }
            }
            Text("Loading...")
                .font(.headline)
                .padding(20)
        }
    }
}


#Preview {
    LoadingIndicatorView()
}
