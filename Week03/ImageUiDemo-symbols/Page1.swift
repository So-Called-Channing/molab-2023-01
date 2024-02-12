//
//  Layout with VStack and HStack

import SwiftUI

struct Page1: View {
  var body: some View {
    VStack {
      HStack {
        Image(systemName: "rectangle")
          .resizable()
          .frame(width:.random(in:50..<200), height: .random(in:50..<200))
        Image(systemName: "rectangle")
          .resizable()
          .frame(width:.random(in:50..<200), height: .random(in:50..<200))
      }
      HStack {
        Image(systemName: "rectangle")
          .resizable()
          .frame(width:.random(in:50..<200), height: .random(in:50..<200))
        Image(systemName: "rectangle")
          .resizable()
          .frame(width:.random(in:50..<200), height: .random(in:50..<200))
      }
    }
  }
}

struct Page1_Previews: PreviewProvider {
  static var previews: some View {
    Page1()
  }
}


