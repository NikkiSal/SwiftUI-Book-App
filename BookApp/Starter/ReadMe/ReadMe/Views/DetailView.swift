
import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    let book: Book
    @State  var showingImagrPicker = false // at first you don't want it to show up
    @Binding var image: UIImage?
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(
                book: book,
                titleFont: .title,
                authorFont: .title2
            )
            VStack {
                Book.Image(title: book.title)
                Button("Update Image…") {
                    showingImagrPicker = true
                }
                .padding()
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagrPicker) {
            PHPickerViewController.View(image: $image)
        }
        
    }
    
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
    }
}
