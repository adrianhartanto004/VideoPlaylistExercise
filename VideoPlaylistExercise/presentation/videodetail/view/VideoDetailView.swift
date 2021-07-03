import AVKit
import SwiftUI

struct VideoDetailView: View {
  @Environment(\.colorScheme) private var colorScheme

  let videoInfo: VideoInfo
  var avPlayer: AVPlayer?

  init(videoInfo: VideoInfo){
    self.videoInfo = videoInfo
    avPlayer = AVPlayer(url: URL(string: videoInfo.video_url)!)
  }

  var body: some View {
    ScrollView{
      VStack(alignment: .leading){
        VideoPlayer(player: avPlayer).frame(height: UIScreen.main.bounds.height / 3)
        VStack(alignment: .leading){
          Text(videoInfo.title)
            .font(.title)
            .foregroundColor(colorScheme == .dark ? .white : .black)

          Text(videoInfo.author)
            .font(.subheadline)
            .foregroundColor(.secondary)

          Divider()

          Text(videoInfo.description)
            .font(.title2)
            .foregroundColor(colorScheme == .dark ? .white : .black)
        }
      }
      .padding()
      .onAppear{
        avPlayer?.play()
      }
      .onDisappear{
        avPlayer?.pause()
      }
    }
    .navigationBarTitle(videoInfo.title)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct VideoDetailView_Previews: PreviewProvider {
  static var previews: some View {
    VideoDetailView(videoInfo: VideoInfo.videoInfoMockData)
  }
}