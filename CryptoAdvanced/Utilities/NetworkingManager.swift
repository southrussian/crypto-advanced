//
//  NetworkingManager.swift
//  CryptoEdvanced
//
//  Created by Danil Peregorodiev on 13.11.2022.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError { // Определяем возможные ошибки сети в виде перечисления.
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {     // Определяем сообщение ошибки, которое будет отображаться в пользовательском интерфейсе приложения.
            switch self {
            case .badURLResponse(url: let url): return "Bad response from URL. \(url)"
            case .unknown: return "Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> { // Метод download используется для загрузки данных из сети.
        return URLSession.shared.dataTaskPublisher(for: url) // Используем метод dataTaskPublisher для загрузки данных из URL.
            .subscribe(on: DispatchQueue.global(qos: .default)) // Подписываемся на глобальную очередь для выполнения загрузки данных в фоновом режиме.
            .tryMap({ try handleURLResponse(output: $0, url: url) }) // Проверяем ответ сервера на наличие ошибок.
            .receive(on: DispatchQueue.main) // Возвращаемся на главную очередь для обновления пользовательского интерфейса.
            .eraseToAnyPublisher() // Приводим к AnyPublisher<Data, Error>.
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data { // Метод handleURLResponse используется для проверки ответа сервера на наличие ошибок.
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data // Возвращаем данные, если ответ сервера не содержит ошибок.
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) { // Метод handleCompletion используется для обработки ошибок, которые могут произойти при выполнении загрузки данных из сети.
        switch completion {
        case .finished:
            break // Завершаем выполнение, если загрузка данных успешно завершена.
        case .failure(let error):
            print(error.localizedDescription) // Выводим сообщение об ошибке, если загрузка данных не удалась.
        }
    }
}
