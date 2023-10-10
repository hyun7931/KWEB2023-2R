const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => res.render('ex3.4-login.html'));

app.post('/login', (req, res) => {
    const username = req.body.username;
    const password = req.body.password;

    res.send(`Username: ${username}, Password: ${password}`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));
