//
//  VideoListView.swift
//  Africa
//
//  Created by Kas Song on 2021/04/01.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: - Properties
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(
                        destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name),
                        label: {
                            VideoListItemView(video: item)
                                .padding(.vertical, 8)
                        })
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { didTapToolbarButton() },
                           label: { Image(systemName: "arrow.2.squarepath") })
                }
            }
        }
    }
}

// MARK: - Selectors
extension VideoListView {
    private func didTapToolbarButton() {
        videos.shuffle()
        hapticImpact.impactOccurred()
    }
}

// MARK: - PreviewProvider
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
