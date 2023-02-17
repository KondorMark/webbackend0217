const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");
var connection;

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  
  var connection
  function dbconn(){
    var mysql = require('mysql')

    connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 's51_db'
    })
    
    connection.connect()
    
  }
   app.get('/helyszin', (req, res) => {

   dbconn()
    
    connection.query('SELECT * from helyszin ', function (err, rows, fields) {
      if (err) 
        console.log( err)
      else{
      console.log(rows)
      res.send(rows)}3
      
    })
    
    connection.end()

    
   })
  app.get('/buli', (req, res) => {
dbconn()
    connection.query('SELECT buli_id,buli.buli_esemeny,buli.buli_datum,buli.buli_kep,helyszin.helyszin_varos,COUNT(jelentkezes_esemeny_id) AS letszam FROM buli left JOIN helyszin ON helyszin_id = buli.buli_helyszin_id LEFT JOIN jelentkezes ON buli.buli_id = jelentkezes.jelentkezes_esemeny_id GROUP BY jelentkezes_esemeny_id;', function (err, rows, fields) {
      if (err) throw err
    
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()



    
  })
   app.post('/keres', (req, res) => {
dbconn()
    let parancs='SELECT * FROM helyszin INNER JOIN buli ON helyszin_id = buli.buli_helyszin_id where helyszin_id=  '+req.body.bevitel1+';'
    
    connection.query(parancs, function (err, rows, fields) {
      if (err) throw err
    
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()
 
  })
  app.get('/kiallitas', (req, res) => {

   dbconn()
    
    connection.query('SELECT * from kialitas ', function (err, rows, fields) {
      if (err) 
        console.log( err)
      else{
      console.log(rows)
      res.send(rows)}3
      
    })
    
    connection.end()

    
  })
  app.post('/jelentkezes', (req, res) => {
dbconn()
    let parancs='INSERT INTO jelentkezes VALUES (NULL, '+req.body.bevitel1+')'
    connection.query(parancs, function (err, rows, fields) {
      if (err) 
          console.log(err)
      else
    
      console.log(rows)
      res.send("ott leszel")
    })
    
    connection.end()
 
  })
  app.delete('/torles_esemeny', (req, res) => {
dbconn()
    let parancs="delete from buli where buli_id="+req.body.bevitel1
    connection.query(parancs, function (err, rows, fields) {
      if (err) 
          console.log(err)
      else
    
      console.log(rows)
      res.send("Sikeres tőrlés!")
    })
    
    connection.end()
 
  })
  app.delete('/torles_esemeny', (req, res) => {
dbconn()
    let parancs="delete from buli where buli_id="+req.body.bevitel1
    connection.query(parancs, function (err, rows, fields) {
      if (err) 
          console.log(err)
      else
    
      console.log(rows)
      res.send("Sikeres tőrlés!")
    })
    
    connection.end()
    })

 app.delete('/Kiallitastorles', (req, res) => {
dbconn()
    let parancs="delete from kialitas where id="+req.body.bevitel1
    connection.query(parancs, function (err, rows, fields) {
      if (err) 
          console.log(err)
      else
    
      console.log(rows)
      res.send("Sikeres tőrlés!")
    })
    
    connection.end()
 
  })
  
  app.get('/letszam', (req, res) => {
dbconn()
    connection.query('SELECT jelentkezes_id,COUNT(jelentkezes_esemeny_id)  AS letszam FROM jelentkezes GROUP BY jelentkezes_esemeny_id;', function (err, rows, fields) {
      if (err)
    
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()

 })


  
  
};
