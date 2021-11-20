//
//  ContentView.swift
//  ZennedAppStore
//
//  Created by Logan Thompson on 11/3/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var onboardinDone = false
    var onboardData = OnboardingDataModel.data

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @ObservedObject var data : OurData
    @State private var currentAlbum : Album?
    @State private var showingOnboarding = true
    @State private var showingSignIn = false
    @State private var showingAnimatedMeditationPlayer = false

    

    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack {
                        ForEach(self.data.albums, id: \.self, content: {
                        album in
                        AlbumArt(album: album, isWithText: true).onTapGesture {
                            self.currentAlbum = album
                        }
                    })
                    }
                })
                LazyVStack {
                    if self.data.albums.first == nil {
                        EmptyView()
                    } else {
                        ForEach((self.currentAlbum?.songs ?? self.data.albums.first?.songs) ?? [Song(name: "", time: "", file: "")],
                            id: \.self,
                            content: {
                        song in
                        SongCell(album: currentAlbum ?? self.data.albums.first!, song: song)
                    })
                }
                }
            }.navigationTitle("Soundscapes")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            showingSignIn.toggle()
                        } label: {
                            Image(systemName: "person.fill")
                        }
                        Button {
                            showingAnimatedMeditationPlayer.toggle()
                        } label: {
                            Image(systemName: "person.fill")
                        }

                    }
                }
            
        }
        
        .sheet(isPresented: $showingOnboarding) {
            OnboardingViewPure(onboardData: onboardData, doneFunction: {
                /// Update your state here
                self.onboardinDone = true
                print("done onboarding")
                showingOnboarding.toggle()
            })
        }
        .sheet(isPresented: $showingSignIn) {
            SignInView()
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


struct AlbumArt : View {
    var album : Album
    var isWithText : Bool
    var body : some View {
        ZStack(alignment: .bottom, content: {
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 200, alignment: .center)
            
            if isWithText == true {
            ZStack {
                Blur(style: .dark)
                Text(album.name).foregroundColor(.white)
            }.frame(height: 60, alignment: .center)
            }
        })
        .frame(width: 170, height: 200, alignment: .center)
        .clipped()
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(20)
    }
}
    
    
struct SongCell : View {
    var album : Album
    var song : Song
    
    var body: some View {
        NavigationLink(destination: PlayerView(album: album, song: song),
                       label: {
        HStack {
            Text(song.name)
                .bold()
            Spacer()
            Text(song.time)
            ZStack {
                Circle()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.accentColor)
                Image(systemName: "chevron.right").frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.white)
            }
        }.padding(20)
        })                    .onTapGesture {
            let impactHeavy = UIImpactFeedbackGenerator(style: .light)
            impactHeavy.impactOccurred()
        }.buttonStyle(PlainButtonStyle())
    }
    
}
        

