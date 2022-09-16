//
//  ContentView.swift
//  noSleepiPhone
//
//  Created by cmStudent on 2022/09/06.
//


import SwiftUI
import UserNotifications


struct ContentView: View {
    @State private var onboardinDone = false
    var data = OnboardingDataModel.data
    
    var body: some View {
        Group {
            if !onboardinDone {
                OnboardingViewPure(data: data, doneFunction: {
                    /// Update your state here
                    self.onboardinDone = true
                    print("done onboarding")
                })
            } else {
//                Text("Hello world")
                MotionView()
                
            }
        }
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
