const express = require('express');
const router = require('./router');

const app = express(); //모듈을 불러와서 서버를 만드는거
const port = 3000;

app.use(router);//router바인딩
//app.use('/path',router);  //path로 들어온거에 이 middleware를 보내줄꺼야 하는거임....
//그래서 주소에 http~~~~/path까지 써 줘야 되는거,,


app.listen(port, () => console.log(`Server listening on port ${port}!`));