//
//  project.swift
//  ImageUiDemo-symbols
//
//  Created by Channing Yang on 2/12/24.
//

import SwiftUI

struct Page10: View {
  var body: some View {
    VStack {
      HStack {
        Image(systemName: "rectangle")
          .resizable()
          .frame(width:100, height: 100)
        Image(systemName: "rectangle")
            .resizable()
            .frame(width:100, height: 100)
      }
      HStack {
        Image(systemName: "rectangle")
            .resizable()
            .frame(width:100, height: 100)
        Image(systemName: "rectangle")
          .resizable()
          .frame(width:100, height: 100)
      }
      // Spacer()
    }
  }
}

struct Page10_Previews: PreviewProvider {
  static var previews: some View {
    Page1()
  }
}
