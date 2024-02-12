//
// NavigationView for pages

import SwiftUI

struct Page9: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Page1()
                } label: {
                    Text("Page1")
                }
                NavigationLink {
                    Page2()
                } label: {
                    Text("Page2")
                }
                NavigationLink {
                    Page3()
                } label: {
                    Text("Page3")
                }
                NavigationLink {
                    Page4()
                } label: {
                    Text("Page4")
                }
                NavigationLink {
                    Page5()
                } label: {
                    Text("Page5")
                }
                NavigationLink {
                    Page6()
                } label: {
                    Text("Page6")
                }
                NavigationLink {
                    Page7()
                } label: {
                    Text("Page7")
                }
                NavigationLink {
                    Page8()
                } label: {
                    Text("Page8")
                }
            }
        }
        .navigationTitle("My Shapes")
    }
}

struct Page9_Previews: PreviewProvider {
    static var previews: some View {
        Page9()
    }
}

