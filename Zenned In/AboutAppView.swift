//
//  AboutAppView.swift
//  Zenned In
//
//  Created by Logan Thompson on 10/26/21.
//

import SwiftUI

struct AboutAppView: View {
    let colors: [Color] = [.red]

    var body: some View {
        VStack {
            Spacer()
            HStack {
            Text("About the App")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            Divider()
            ScrollView {
                ForEach(colors, id: \.self) { color in
                    ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.accentColor)
                    .frame(height: 250, alignment: .center)
                    .shadow(radius: 15)
                    .padding()
                VStack {
                    HStack {
                        Text("What is Zenned In?")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding(35)
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .topLeading)

                        Text("We are here to provide you with proven mindful methods, guided meditations, and other practices to relax the body and mind and help reduce stress.")
                            .foregroundColor(.white)
                            .font(.body)
                            .padding(20)
                        Spacer()
                    }
                    }
                }
                ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.accentColor)
                .frame(height: 250, alignment: .center)
                .shadow(radius: 15)
                .padding()
            VStack {
                HStack {
                    Text("Become a Beta Tester")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(35)
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .topLeading)

                    Text("We are here to provide you with proven mindful methods, guided meditations, and other practices to relax the body and mind and help reduce stress.")
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(20)
                    Spacer()
                }
                }
                ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.accentColor)
                .frame(height: 450, alignment: .center)
                .shadow(radius: 15)
                .padding()
            VStack {
                HStack {
                    Text("Disclaimers")
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(30)
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30, alignment: .topLeading)
                
                    Text("Our mobile application may contain (or you may be sent through our mobile application) links to other websites or content belonging to or originating from third parties or links to websites and features in banners or other advertising. Such external links are not investigated, monitored, or checked for accuracy, adequacy, validity, reliability, availability or completeness by us.")
                        .foregroundColor(.white)
                        .font(.footnote)
                        .padding(20)
                Text("WE DO NOT WARRANT, ENDORSE, GUARANTEE, OR ASSUME RESPONSIBILITY FOR THE ACCURACYOR RELIABILITY OF ANY INFORMATION OFFERED BY THIRD-PARTY WEBSITES LINKED THROUGH THE SITE OR ANY WEBSITE OR FEATURELINKED IN ANY BANNER OR OTHER ADVERTISING. WE WILL NOT BE A PARTY TO OR IN ANY WAY BE RESPONSIBLE FOR MONITORING ANY TRANSACTION BETWEEN YOU AND THIRD-PARTY PROVIDERS OF PRODUCTS OR SERVICES")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .padding(20)
                    Spacer()
                }
                }
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*/Text("Rate on the App Store")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(5.0)
                    .hoverEffect(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)/*@END_MENU_TOKEN@*/
            }
        }
    }
}

struct AboutAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutAppView()
    }
}
