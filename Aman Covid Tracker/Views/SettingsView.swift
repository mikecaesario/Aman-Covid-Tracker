//
//  SettingsView.swift
//  Aman Covid Tracker
//
//  Created by Michael Caesario on 26/06/22.
//

import SwiftUI

struct SettingsView: View {
    
    let hotlineURL = URL(string: "tel:123")
    let websiteURL = URL(string: "https://www.who.int")
        
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
        
        SettingsView()
            .preferredColorScheme(.dark)
    }
}

extension SettingsView {
    
    var links: some View {
        Section {
            if let url = hotlineURL {
                Link("Hotline", destination: url)
            }
            
            if let url = websiteURL {
                Link("Website", destination: url)
            }
        }
        .listRowBackground(Color.main.accentColor.opacity(0.7))
        .font(.headline)
        .foregroundColor(.white)
    }
    
    var developerInfo: some View {
        Section {
            VStack(alignment: .leading, spacing: 20) {
                Text("Developer")
                
                Text("This app was built by Michael Caesario, he used Swift, SwiftUI and Combine as a side project. this app use third party source for the data, and the Developer is not held responsible for any abuse of the information provided. this app or official source for Covid related information in any way.")
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
