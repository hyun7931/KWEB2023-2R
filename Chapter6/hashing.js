const util = require('util');
const crypto = require('crypto');

const pbkdf2 = util.promisify(crypto.pbkdf2); // 1)password (암호화할 문자열)

//2) salt 3) iterations:반복횟수 4) key_length : 결과로 나오는 키의 길이 정해주기 byte단위의 길이
//5) algo : 알고리즘

const encrypt = async text => {
    const ALGO = 'sha512';
    const KEY_LEN = 64;
    const digest = await pbkdf2(text, '', 1, KEY_LEN, ALGO); 
    //text문자열은 salt없이 반복은1, key_legth로, 알고리즘은 이걸 써줘
    console.log(`${text} | ${digest.toString('base64')}`);
};


(async () => await encrypt('samplepassword'))();
/*(async () => {
    await encrypt('samplepasswordsamplepasswordsamplepasswordsamplepasswordsample');
    await encrypt('samplepasswordsamplepastwordsamplepasswordsamplepasswordsample');
    })();*/