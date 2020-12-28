import UIKit

//создаю массив заданного, входными параметрами, размера
func increasingArray(first:Int, last:Int) -> [Int]{
    var array = [Int]()
    for i in first ... last {
        array.append(i)
    }
    return array
}
//корректирую входной массив, исходя из параметров кратности и необходимости удалить или добавить
func editArray(array:[Int], divider:Int, boolType:Bool) -> [Int]{
    var arrayForReturn = array
    for value in arrayForReturn {
        if boolType == true {
            if (value % divider) != 0 {
                arrayForReturn.remove(at: arrayForReturn.firstIndex(of: value)!)
            }
        }else{
            if (value % divider) == 0 {
                arrayForReturn.remove(at: arrayForReturn.firstIndex(of: value)!)
            }
        }
    }
    return arrayForReturn
}
//рекурсивная функция Фиббоначи. Не использовал, т.к. на больших числах очень долго думает
func fibRecursive(n: Int) -> Int{
    return n > 1 ? (fibRecursive(n: n - 1) + fibRecursive(n: n - 2)) :n
}
//цикл для вычисления Фибоначчи, выбрал т.к. на любом n думает примерно одинаково
func fibForIn(n: Int) -> Int{
    var number1 = 1
    var number2 = 1
    for _ in 0 ..< n - 2 {
        let number = number1 + number2
        number1 = number2
        number2 = number
    }
    return number2
}
//создаю массив с числами Фибоначчи с помощью доработанной функции, мог доработать первую функцию доп параметром и проверкой
func fibonacciArray(first:Int, last:Int) -> [Int]{
    var array = [Int]()
    for i in first ... last {
        var nFib = 0
        switch i {
        case 1,2:
            nFib = 1
        default:
            nFib = fibForIn(n: i)
        }
        array.append(nFib)
    }
    return array
}
//Проверка числа на простое
func isPrime(_ number:Int) -> Bool{
    var i = 2
    while (i*i) <= number {
        if number % i == 0 { return false }
        i += 1
    }
    return true
}
var array = increasingArray(first: 1, last: 100)//создаю возрастающий массив от 1 до 100
print(array)
array = editArray(array: array, divider: 2, boolType: false)//удаляю из массива четные числа
print(array)
array = editArray(array: array, divider: 3, boolType: true)//удаляю из массива числа не кратные 3
print(array)

var fibArray = fibonacciArray(first: 1, last: 50)//массив из 50 элементов, заполненный числами Фибоначчи
print(fibArray)
var primeArray = [Int]()//пустой массив для заполнения простыми числами
for i in 2 ... 1000000 where primeArray.count < 100 {
    if isPrime(i) == true {
        primeArray.append(i)
    }
    
}
print(primeArray)
