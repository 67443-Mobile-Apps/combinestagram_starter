import Foundation
import SwiftUI
import UIKit
import Combine
import Photos

extension Notification.Name {
  static let savedPhoto = Notification.Name("saved collage")
  static let couldNotSavePhoto = Notification.Name("could not save collage")
}

class ViewModel: ObservableObject {

  @Published var images: [UIImage] = []
  @Published var collage: Image?
  @Published var publisher = NotificationCenter.Publisher.init(center: .default, name: .savedPhoto)
  @Published var imageId: String?

  var uiCollage: UIImage?

  func updateImage() {
  }

  func clear() {
    // clear the images array and update the image
  }

  func save() {
  }

  func displayTitle() -> String {
    // return the number of photos (e.g. 1 photo or 6 photos)
    // if there are no photos, return "combinestagram"
  }

  func alertTitle() -> String {
    return self.publisher.name.rawValue
  }

  func alertMessage() -> String {
    // return the ID of the saved photo or an error message
  }
}
