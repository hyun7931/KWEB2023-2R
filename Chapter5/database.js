const mysql = require('mysql2/promise');
const pool = mysql.createPool({
host: 'localhsot',
port: 3306,
user: kwebuser,
password: kwebpw,
database: kwebdb1,
});
const runQuery = async sql => {
const conn = await pool.getConnection();
try {
const [result] = await conn.query(sql);
return result; // row들의 array 또는 undefined 값
} finally {
conn.release();
}
};
module.exports = { runQuery };