//
// NavigationView

import SwiftUI

struct Page5: View {
  var body: some View {
    NavigationView {
      List {
        ForEach(0 ..< imageArray.count, id: \.self) {
            index in
          let item = imageArray[index]
          NavigationLink {
            VStack {
              Image(systemName: item)
                .resizable()
                .frame(width:100, height: 100)
              Text(item)
              Spacer()
            }
          } label: {
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
  }
}

struct Page5_Previews: PreviewProvider {
  static var previews: some View {
    Page5()
  }
}

// https://tisch.nyu.edu/about/directory
