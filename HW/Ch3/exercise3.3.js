const express = require('express');
const app = express();
const port = 3000;

app.get('/factorial', (req, res) => {
    const number = parseInt(req.query.number);
    return res.redirect(`/factorial/${number}`);
});

app.get('/factorial/:number', (req, res) => {
    const number = parseInt(req.params.number);
    const factorialResult = calculateFactorial(number);
    return res.send(`${parsedNumber}! = ${result}`);
});


function calculateFactorial(number) {
    if (number === 0 || number === 1) {
        return 1;
    }
    return number * calculateFactorial(number - 1);
}

app.listen(port, () => console.log(`Server is running on port ${port}`));