const express = require('express');
const { runQuery } = require('./database');
const app = express();
const port = 3000;

app.get('/fare', async (req, res) => {
  try {
    const { uid } = req.query;
    const sql = `
      SELECT users.name, 
      Sum(Round(types.fare_rate * trains.distance / 1000, -2)) AS totalFare
      FROM tickets 
      INNER JOIN users ON tickets.user = users.id AND users.id = ? 
      INNER JOIN trains ON tickets.train = trains.id 
      INNER JOIN types ON trains.type = types.id
    `;
    const [{ name, totalFare }] = await runQuery(sql, [uid]);
    res.send(`Total fare of ${name} is ${totalFare} KRW.`);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
});

app.get('/train/status', async (req, res) => {
  try {
    const { tid } = req.query;
    const sql = `
      SELECT Count(*) AS occupied, max_seats AS maximum 
      FROM tickets 
      INNER JOIN trains ON trains.id = tickets.train AND trains.id = ? 
      INNER JOIN types ON trains.type = types.id
    `;
    const [{ occupied, maximum }] = await runQuery(sql, [tid]);
    const isSeatsLeft = occupied < maximum;
    res.send(`Train ${tid} is ${isSeatsLeft ? 'not ' : ''}sold out`);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));
