/*: 
 
## Intro to Swift Functional Programming with Bob
Full tutotiral originally published on [Medium] by Bob Lee
 - Last Update on March 1st, 2017
 - Swift 3 & iOS 10

[Medium]: https://medium.com/ios-geek-community/intro-to-swift-functional-programming-with-bob-9c503ca14f13#.x47hcc2mn
*/

//: Non Functional Programming
// Somewhere in ViewController
let numbers = [1, 2, 3]
var sum = 0
for number in numbers {
  sum += number
}

// Somewhere in NextViewController
let newNumbers = [4, 5, 6]
var newSum = 0
for newNumber in numbers {
  newSum += newNumber
}

//: Functional Approach
func saveMeFromMadness(elements: [Int]) -> Int {
  var sum = 0
  for element in elements {
    sum += element
  }
  
  return sum
}



// Somewhere in ViewController
saveMeFromMadness(elements: [1, 2, 3])
// Somewhere in NextViewController
saveMeFromMadness(elements: [4, 5, 6])

//: Introduction to Filter Imperatively

let recentGrade = ["A", "A", "A", "A", "B", "D"] // My College Grade

var happyGrade: [String] = []
for grade in recentGrade {
  if grade == "A" {
    happyGrade.append(grade)
  } else {
    print("Ma mama not happy")
  }
}

print(happyGrade) // ["A", "A", "A", "A"]

//: Functional Filter
let mumHappy: (String) -> Bool = { grade in return grade == "A" }
let mamHappy: (String) -> Bool = { $0 == "A" }

//: Filter String
func stringFilter(grade: [String], returnBool: (String) -> Bool) -> [String] {
  var happyGrade: [String] = []
  
  for letter in grade {
    if returnBool(letter) {
      happyGrade.append(letter)
    }
  }
  return happyGrade
}
let myGrade = ["A", "A", "A", "A", "B", "D"]
let lovelyGrade = stringFilter(grade: recentGrade, returnBool: mamHappy)
print(lovelyGrade) // ["A", "A", "A", "A"]

//: Pass Closure Directly
stringFilter(grade: myGrade, returnBool: { grade in
  return grade == "A" })

//: Generic Filter
func myFilter<Bob>(array: [Bob], logic: (Bob) -> Bool) -> [Bob] {
  var result: [Bob] = []
  for element in array {
    if logic(element) {
      result.append(element)
    }
  }
  return result
}
let AStudent = myFilter(array: Array(1...100), logic: { $0 >= 93 && $0 <= 100 })
print(AStudent) // [93, 94, 95, ... 100]

//: Application to Vote Counting
let answer = [true, false, true, false, false, false, false]
let trueAnswer = myFilter(array: answer, logic: { $0 == true })

//: Trailing Closure

let falseAnswer = myFilter(array: answer) { $0 == false }

//: Swift Default Filter

let zeroToHund = Array(1...100)
print(zeroToHund.filter{ $0 % 2 == 0 }.filter {$0 <= 50})

/*:
> Follow me on [Instagram](https://instagram.com/bobthedev) and [Facebook Page](https://facebook.com/bobthedeveloper) for personal journey and regular updates! All of my free resources available [here](https://bobleesj.gitbooks.io/bob-s-learning-journey/content/WORK.html)
*/

