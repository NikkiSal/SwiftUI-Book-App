
import SwiftUI

struct ContentView: View {
    @State private var library = Library()
    var body: some View {
        NavigationView {
            List(library.sortedBooks, id: \.self) { book in
                BookRow(book: book,
                        image: $library.uiImages[book]
                )
            }
            .navigationBarTitle("My Library")
        }
    }
}

struct BookRow: View {
    let book: Book
    @Binding var image: UIImage?
    
    var body: some View {
        NavigationLink(
            destination: DetailView(book: book, image: $image)
        ) {
            HStack {
                Book.Image(title: book.title, size: 80)
                
                TitleAndAuthorStack(
                    book: book,
                    titleFont: .title2,
                    authorFont: .title3
                )
                .lineLimit(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
