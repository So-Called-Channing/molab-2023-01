//
// ForEach Text Spacer

import SwiftUI

struct Page3: View {
  var body: some View {
    VStack {
      ForEach(0 ..< imageArray.count, id: \.self) {
          index in
        let item = imageArray[index]
        HStack {
          Image(systemName: item)
            .resizable()
            .frame(width:100, height: 100)
          Text(item)
          Spacer()
        }
      }
    }
  }
}

struct Page3_Previews: PreviewProvider {
  static var previews: some View {
    Page3()
  }
}

// https://tisch.nyu.edu/about/directory
