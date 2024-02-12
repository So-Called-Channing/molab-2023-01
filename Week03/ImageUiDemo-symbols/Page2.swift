//
// array and ForEach

import SwiftUI

// Array of image names
let imageArray = [
  "rectangle",
  "triangle",
  "hexagon",
  "pentagon",
  "rhombus",
  "diamond",
  "circle",
  "seal",
  "oval",
  "capsule"
]

struct Page2: View {
  var body: some View {
    VStack {
        ForEach(0 ..< imageArray.count, id: \.self) {
            index in
        Image(systemName: imageArray[index])
          .resizable()
          .frame(width:100, height: 100)
      }
    }
  }
}

struct Page2_Previews: PreviewProvider {
  static var previews: some View {
    Page2()
  }
}

// https://tisch.nyu.edu/about/directory
