//
//  ContentView.swift
//  BucketList
//
//  Created by Derya Antonelli on 08/12/2022.
//

import SwiftUI
import MapKit
import LocalAuthentication


struct ContentView: View {
    @State private var isUnlocked = false
    
    
    var body: some View {
            VStack {
                if isUnlocked {
                    Text("unlocked")
                } else {
                    Text("locked")
                }
        }
        .onAppear(perform: authenticate)
        
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    print("there was a problem")
                    // there was a problem
                }
            }
            
        } else {
            print("no biometrics")
            // no biometrics
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
