//
//  SettingsView.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 01.12.2022.
//

import SwiftUI

struct SettingsView: View {
    
    let geckoURL = URL(string: "https://www.coingecko.com/ru")!
    let vkURL = URL(string: "https://vk.com/south.russian")!
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Автор приложения")) {
                    VStack(alignment: .leading) {
                        Image("logo")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        Text("Приложение выполнено в рамках курсовой работы по курсу 'Разработка мобильных приложений'. Разработчик: Перегородиев Д. Е. - студент группы ФИТУ-4-2а кафедры ИИСТ Южно-Российского государственного политехнического университета (НПИ) им. М. И. Платова")
                            .font(.headline)
                            .foregroundColor(Color.theme.accent)
                    }
                    .padding(.vertical)
                    Link("Страница разработчика в VK 💻", destination: vkURL)
                }
                Section(header: Text("API приложения")) {
                    Image("coingecko")
                        .resizable()
                        .frame(width: 400, height: 110)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Link("Страница API", destination: geckoURL)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Настройки")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
