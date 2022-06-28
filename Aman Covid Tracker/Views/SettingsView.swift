//
//  SettingsView.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct SettingsView: View {
        
    var body: some View {
        List {
            links
            developerInfo
        }
        .listStyle(.insetGrouped)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    var links: some View {
        Section {
            Link("Hotline", destination: URL(string: "tel:123")!)
            Link("Website", destination: URL(string: "https://www.who.int")!)
        }
        .listRowBackground(Color.main.accentColor.opacity(0.7))
        .font(.headline)
        .foregroundColor(.white)
    }
    
    var developerInfo: some View {
        Section {
            VStack(alignment: .leading, spacing: 20) {
                Text("Developer")
                
                Text("This app was built by Michael Caesario, he used Swift, SwiftUI and Combine as a side project. this app is not an indicator and or official source for Covid related information in any way.")
                    .font(.body)
            }
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .listRowBackground(Color.main.accentColor.opacity(0.7))
        .font(.headline)
        .foregroundColor(.white)
    }
}
