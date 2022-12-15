//
//  ShopView.swift
//  VinylsSwiftUI
//
//  Created by Ludovic Ollagnier on 15/12/2022.
//

import SwiftUI

struct ShopView: View {

    @EnvironmentObject private var library: Library

    var body: some View {
        VStack {
            Text("Shop")
                .font(.largeTitle)
            Text("You already have \(library.vinyls.count) vinyls")
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
            .environmentObject(Library())
    }
}
