const circularShapes = require('./circular-shapes')
//얘가 export한 함수등을 쓸 수 있음
const path = require('path') //내장모델임
//circularShapes.getCircleArea //이런식으로

//일부만 import할 수 있음 # 비구조화 할당 / 나는 이 함수만 쓸거야.
const{getCircumference} = require("./circular-shapes")

const r = 10;
const h =20;

//console.log('Circumference = $(circularShapes.getCir')

const myFile='/hyun/home/kweb/example.js';
const dirname = path.dirname(myFile);
console.log(dirname)