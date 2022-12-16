//
//  ShopView.swift
//  VinylsSwiftUI
//
//  Created by Ludovic Ollagnier on 15/12/2022.
//

import SwiftUI

struct ShopView: View {

    @EnvironmentObject private var library: Library
    @State private var image: Image?

    var body: some View {
        VStack {
            Text("Shop")
                .font(.largeTitle)
            Text("You already have \(library.vinyls.count) vinyls")
            Button("Download image") {
                Task {
                    await loadData()
                }
            }
            if let image {
                image
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
    }

    private func loadData() async {
        guard let url = URL(string: "https://a1.mzstatic.com/Purple122/v4/ec/77/5d/ec775ddc-8c38-f4c5-2f08-0114b3f876e1/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png") else { return }
        let urlRequest = URLRequest(url: url)
        guard let (data, response) = try? await URLSession.shared.data(for: urlRequest) else { return }
        print(response)
        guard let image = UIImage(data: data) else { return }
        self.image = Image(uiImage: image)
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
            .environmentObject(Library())
    }
}
