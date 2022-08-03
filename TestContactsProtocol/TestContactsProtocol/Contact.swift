//
//  Contact.swift
//  TestContactsProtocol
//
//  Created by Владимир Макаров on 08.12.2021.
//

import Foundation

struct Contact {
    let fullName: String
    let phone: String
    let email: String
}

extension Contact {
   
    static func loadContact() -> [Contact] {
        [
            Contact(fullName: "Вася Пупкин", phone: "+79990088", email: "as@www.ru"),
            Contact(fullName: "Петя Петин", phone: "+77770099", email: "aу@ууу.ru"),
            Contact(fullName: "Ваня Ванин", phone: "+70001122", email: "aй@ссс.ru"),
            Contact(fullName: "Иван Тванов", phone: "+73332244", email: "яяя@тттт.ru"),
            Contact(fullName: "Митя Херов", phone: "+76665543", email: "иа@свы.ru")
        ]
    }
}
