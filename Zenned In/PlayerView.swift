//
//  PlayerView.swift
//  Zenned In
//
//  Created by Logan Thompson on 10/12/21.
//

import Foundation
import SwiftUI
import Firebase
import AVFoundation

struct MusicPlayerBar: View {
    
    var body: some View {
        HStack {
        }.frame(maxWidth: .infinity, maxHeight: 60)
    }
}

struct MusicPlayerView: View {
    @State var album : Album
    @State var song : Song
    @State var player = AVPlayer()
    @State var isPlaying : Bool = true
    @State private var showDetails: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if showDetails {
                PlayerView(album: album, song: song)
            } else {
                MusicPlayerBar()
            }
        
        }.onTapGesture {
            showDetails.toggle()
        }
    }
}

struct PlayerView : View {
    @State var album : Album
    @State var song : Song
    @State var player = AVPlayer()
    @State var isPlaying : Bool = true
    
    var body: some View {
        ZStack {
        Image(album.image)
            .resizable().edgesIgnoringSafeArea(.all)
        Blur(style: .dark).edgesIgnoringSafeArea(.all)
        VStack {
            Spacer()
            AlbumArt(album: album, isWithText: false)
            Text(song.name).font(.title).fontWeight(.light).foregroundColor(.white)
                .padding()
            Spacer()
            ZStack {
                Color.white.cornerRadius(20).shadow(radius: 10)
                ScrollView {
                    VStack {
                HStack {
                    
//                Button(action: self.previous, label: {
//                    Image(systemName: "arrow.left.circle").resizable()
//                }).foregroundColor(.accentColor).frame(width: 50, height: 50, alignment: .center)
                Button(action: self.playPause, label: {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill").resizable()
                })                    .onTapGesture {
                    let impactHeavy = UIImpactFeedbackGenerator(style: .light)
                    impactHeavy.impactOccurred()
                }.foregroundColor(.accentColor).frame(width: 100, height: 100, alignment: .center).padding()
//                Button(action: self.next, label: {
//                    Image(systemName: "arrow.right.circle").resizable()
//                }).foregroundColor(.accentColor).frame(width: 50, height: 50, alignment: .center)
                }
            }.edgesIgnoringSafeArea(.bottom).frame(height: 200, alignment: .bottom)
                }
            }
        }
        }.navigationBarBackButtonHidden(false)
            .onAppear() {
            self.playSong()
            
        }
    }

    func playSong() {
        let storage = Storage.storage().reference(forURL: self.song.file)
            storage.downloadURL { (url, error) in
            if error != nil {
                print(error)
                } else {
                    
                    do {
                        try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                        
                    }
                    catch {
                        //report an error
                        
                    }
                    print(url?.absoluteString)
                    player = AVPlayer(url: url!)
                    player.play()
                }
            }
        }

    func playPause() {
        self.isPlaying.toggle()
        if isPlaying == false {
            player.pause()
        } else {
            player.play()
        }
    }

    func next() {
        if let currentIndex = album.songs.firstIndex(of: song) {
            if currentIndex == album.songs.count - 1 {
        
            } else {
                player.pause()
                song = album.songs[currentIndex + 1]
                self.playSong()
            }
        }
    }
    
        func previous() {
            if let currentIndex = album.songs.firstIndex(of: song) {
                if currentIndex == album.songs.count - 1 {
            
                } else {
                    player.pause()
                    song = album.songs[currentIndex - 1]
                    self.playSong()
                }
            }
        }
}



