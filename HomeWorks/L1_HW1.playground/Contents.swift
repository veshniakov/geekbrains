import UIKit

let a: Float = 1
let b: Float = 4
let c: Float = 2
var d = pow(b, 2) - (4 * a * c)
var x1: Float = 0
var x2: Float = 0

   if d < 0 {
            print("Дискриминант меньше нуля. Уравнение не имеет корней")
        } else if d == 0 {
            x1 = (-b + sqrt(d))/2 * a
            print("Дискриминант равен нулю. Уравнение имеет 1 корень равный \(x1)")
        } else {
            x1 = (-b + sqrt(d))/2 * a
            x2 = (-b - sqrt(d))/2 * a
            print("Дискриминант больше нуля. Уравнение имеет 2 корня: \(x1) и \(x2)")
        }

let catetA: Float = 3
let catetB: Float = 4
var gipotenuza = sqrt(pow(catetA, 2) + pow(catetB, 2))
var area = catetA * catetB / 2
var perimetr = catetA + catetB + gipotenuza
print("Площадь прямоугольного треугольника равна \(area). Периметр равен \(perimetr). Гипотенуза равна \(gipotenuza)")

var deposit: Double = 10000
let percent: Double = 10
let years = 5
var i = 0

while i < years {
    deposit = deposit + (deposit * (percent / 100))
    i += 1
    print("По истечению \(i)-го года, сумма вклада составит \(deposit)")
}
