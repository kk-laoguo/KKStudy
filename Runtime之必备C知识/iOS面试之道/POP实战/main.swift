//
//  main.swift
//  POP实战
//
//  Created by zainguo on 2019/8/6.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation

protocol Food { }
struct Fish: Food {}
struct Bone: Food {}

protocol Animal {
    
    
//    func eat(food: Food)
//    func greet(other: Animal)
    
    // pop
    associatedtype FoodType: Food
    func eat(food: FoodType)
    func greet(other: Self)

}

struct Cat: Animal {
//    func eat(food: Food) {
//        guard let _ = food as? Fish  else {
//            print("猫只吃鱼")
//            return
//        }
//    }
//    func greet(other: Animal) {
//        if let _ = other as? Cat {
//            print("喵")
//        } else {
//            print("猫很骄傲, 不会对其他动物打招呼")
//        }
//    }
    
    
    
    func eat(food: Fish) {
        
    }
    func greet(other: Cat) {
        print("喵")
    }
}

struct Dog: Animal {
    

//    func eat(food: Food) {
//        guard let _ = food as? Bone else {
//            print("🐶只啃骨头")
//            return
//        }
//    }
//    func greet(other: Animal) {
//        if let _ = other as? Dog {
//            print("汪汪")
//        } else {
//            print("狗很骄傲, 不会对其他动物打招呼")
//        }
//    }
    
    func eat(food: Bone) {
        print("🐶吃骨头")
    }
    func greet(other: Dog) {
        print("汪汪")
    }
}

let dog = Dog()
dog.eat(food: Bone())



protocol Flyable {
    
}

protocol Bird {
    var name: String {get}
    var canFly: Bool {get}
}

extension Bird {
    var canFly: Bool {
        return self is Flyable
    }
}


struct ButterFly: Flyable {
    
}
struct Penguin: Bird {
    var name = "Penguin"
}
struct Eagle: Bird {
    var name = "Eagle"

}

enum FlyablePokemon: Flyable {
    case pidgey
    case Duduo
}
