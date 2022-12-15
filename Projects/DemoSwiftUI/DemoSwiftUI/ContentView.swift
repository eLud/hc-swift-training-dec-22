//
//  ContentView.swift
//  DemoSwiftUI
//
//  Created by Ludovic Ollagnier on 15/12/2022.
//

import SwiftUI

struct ContentView: View {

    let cornerSize: Double
    @State private var sideBySide: Bool = true
    @State private var text: String = ""

    var body: some View {
        VStack {
            if sideBySide {
                HStack {
                    MyCustomView(cornerSize: cornerSize)
                    MyCustomView(cornerSize: cornerSize)
                }
            } else {
                VStack {
                    MyCustomView(cornerSize: cornerSize)
                    MyCustomView(cornerSize: cornerSize)
                }
            }
            Toggle("sideBySide", isOn: $sideBySide)
            Text(text)
            TextField("Mon texte", text: $text)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cornerSize: 20)

    }
}

struct MyCustomView: View {

    let cornerSize: Double

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "leaf")
                .padding(20)
                .background(Color.red)
                .cornerRadius(10)
                .padding()
                .background(Color.yellow)
                .cornerRadius(cornerSize)
                .rotation3DEffect(.degrees(45), axis: (x: 10, y: 5, z: 20))
                .shadow(radius: 20)
            Text("Hello World")
        }
    }
}
