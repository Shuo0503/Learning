// learning fundamental of Javascript
console.log("Hello World");

// var let and const
let age;
age = 31;
console.log(age);

const year = 2024;
console.log(year);

const username = "John";
const height = 180;
const weight = 150.3;
const isCool = true;
const x = null;
const y = undefined;
let z;

console.log(typeof z);
console.log("My name is " + username + " and I am " + weight + " pounds");
console.log(`My name is ${username} and I am ${weight} pounds`);
const John = `My name is ${username} and I am ${weight} pounds`;
console.log(John);


console.log(John.length);
console.log(John.toLowerCase());
console.log(John.toUpperCase());
console.log(John.substring(0,10).toUpperCase());
console.log(John.split(""))
console.log(John.split(" "))

const numbers = new Array(1, 2, 3, 4, 5);
const fruits = ["apples", "oranges", "pears", 10, true];
fruits.push("mangos");
fruits.unshift("strawberry");
fruits.pop();
console.log(numbers);
console.log(fruits);
console.log(fruits[1]);
console.log(Array.isArray(fruits));
console.log(Array.isArray(fruits[1]));
console.log(fruits.indexOf('oranges'));

// object
const dog = {
    firstName: "Koma",
    lastName: "Huang",
    gender: "Male",
    age: "3",
    hobbies: ["scream", "break toys", "eat treats"],
    weight: "20 lbs",
    IQ: "Not very smart",
    address: {
        street: "Tyrone",
        city: "Sherman Oaks",
        state: "CA"
    }
}
console.log(dog);
console.log(dog.IQ);
console.log(dog.hobbies, dog.firstName, dog.lastName);
console.log(dog.hobbies[1]);

const{firstName, lastName, address:{city}} = dog;
console.log(firstName);
console.log(city);
dog.email = "whineeee.gmail.com"

const todos = [
    {
        id: 1,
        text: "Whineeeee",
        isCompleted: true,
    },
    {
        id: 2,
        text: "Eat treats",
        isCompleted: true,
    },
    {
        id: 3,
        text: "Sleep",
        isCompleted: false,
    },
];

console.log(todos);
console.log(todos[1].text);

const todosJSON = JSON.stringify(todos)
console.log(todosJSON)

const a = 11;
const b = 4 ;

// conditions
if (a === 10) {
    console.log("a is 10");
} else if (a > 10) {
    console.log("a is greater than 10");
} else {
    console.log("a is less than 10");
}

if (a < 10 || b > 1) {
    console.log("a is less than 10 or b is geater than 1");
} else if (a > 10 && b < 5) {
    console.log("a is greater than 10 and b is less than 5");
} else {
    console.log("b is greater than 5 or less than 1")
}


const c = 11;
const color = c > 10 ? "red" : "blue";
console.log(color);

const A = a < 10 ? "A" : "B";
console.log(A);

switch(color) {
    case "red":
        console.log("color is red");
        break;
    case "blue":
        console.log("color is blue");
        break;
    default:
        console.log("color is not red nor blue");
}

// loops
for (let i = 0; i < 10; i ++) {
    console.log(`For Loop Number: ${i}`);
}

let i = 0;
while (i < 10) {
    console.log(`For Loop Number: ${i}`);
    i++;
}

for (let i = 0; i < todos.length; i ++) {
    console.log(todos[i].text);
}

for(let todo of todos) {
    console.log(todo);
    console.log(todo.text);
    console.log(todo.id);
}

// Building a Pyramid Generator with Javascript
const character = "#";
const count = 8;
const rows = [];
let inverted = true;

function padRow(rowNumber, rowCount) {
  return " ".repeat(rowCount - rowNumber) + character.repeat(2 * rowNumber - 1) + " ".repeat(rowCount - rowNumber);
}

for (let i = 1; i <= count; i++) {
  if (inverted) {
    rows.unshift(padRow(i, count));
  } else {
    rows.push(padRow(i, count));
  }
}

let result = ""

for (const row of rows) {
  result = result + "\n" + row;
}

console.log(result);

// Review Javascript Fundamentals with building Gradebook App
function getAverage(scores) {
    let sum = 0;
  
    for (const score of scores) {
      sum += score;
    }
  
    return sum / scores.length;
  }
  
  function getGrade(score) {
    if (score === 100) {
      return "A++";
    } else if (score >= 90) {
      return "A";
    } else if (score >= 80) {
      return "B";
    } else if (score >= 70) {
      return "C";
    } else if (score >= 60) {
      return "D";
    } else {
      return "F";
    }
  }
  
  function hasPassingGrade(score) {
    return getGrade(score) !== "F";
  }
  
  function studentMsg(totalScores, studentScore) {
    let average = getAverage(totalScores);
    if (studentScore >= 60) {
        return `Class average: ${average}. Your grade: ${studentScore}. You passed the course.`
    } else {
        return `Class average: ${average}. Your grade: ${studentScore}. You failed the course.`
    }
  }
  console.log(studentMsg([92, 88, 12, 77, 57, 100, 67, 38, 97, 89], 37));

