var express = require('express');
var mysql = require('mysql');

var app = express();
app.use(express.json());

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'luxdb'
});

connection.connect(function(err){
    if(err){
        throw error;
    }else{
        console.log("Connection DB ok");
    };
});

app.get('/', function(request, response ) {
    response.send("ruta incio");
});

//Ambientes - - - - -- - - - - - - - - - -- - - - - - - - - -- - 
app.get('/ambientes', (request, response) => {
    connection.query("SELECT * FROM ambiente", (err, rows) => {
        if(err){
            throw err;
        }else{
            response.send(rows);
        }
    })
});

app.post('/ambientes', (request, response)=> {
    let data = {
        clasificacionAmbiente: request.body.clasificacionAmbiente,
        descripcion: request.body.descripcion,
        volumen: request.body.volumen,
        inmueble_id: request.body.inmueble_id
    };

    let sql = "INSERT INTO ambiente SET ?";

    connection.query(sql, data, function(err , results){
        if(err){
            throw err;
        }else {
            response.send(results);
        }
    })
});

app.delete('/ambientes/:id', (request, response) => {
    connection.query("DELETE FROM ambiente WHERE id = ?", [request.params.id], (err, rows) => {
        if(err){
            throw err;
        }else{
            response.json({rows});
        }
    })
});

//Artefacto - - - - - - - - - - - - - - - - - -  -- - - - - - - 
app.get('/artefactos', (request, response) => {
    connection.query("SELECT * FROM artefacto", (err, rows) => {
        if(err){
            throw err;
        }else{
            response.send(rows);
        }
    })
});

app.get('/artefactos/:id', (request, response) => {
    connection.query("SELECT * FROM artefacto WHERE id = ?", [request.params.id], (err, rows) => {
        if(err){
            throw err;
        }else{
            response.json({rows});
        }
    })
});

app.post('/artefactos', (request, response)=> {
    let data = {
        calorResidual: request.body.calorResidual,
        categoria: request.body.categoria,
        consumo: request.body.consumo,
        hsUsoDiario: request.body.hsUsoDiario,
        nombre: request.body.nombre,
        tipoEnergia: request.body.tipoEnergia,
        ambiente_id: request.body.ambiente_id,
        proveedor_id: request.body.proveedor_id
    };

    let sql = "INSERT INTO artefacto SET ?";

    connection.query(sql, data, function(err , results){
        if(err){
            throw err;
        }else {
            response.send(results);
        }
    })
});

app.delete('/artefactos/:id', (request, response) => {
    connection.query("DELETE FROM artefacto WHERE id = ?", [request.params.id], (err, rows) => {
        if(err){
            throw err;
        }else{
            response.json({rows});
        }
    })
});

//Cuadro tarifario - - - - -  - - - -- -- - - -- - - - -- - - - --
app.get('/cuadros-tarifarios', (request, response) => {
    connection.query("SELECT * FROM cuadrosTarifario", (err, rows) => {
        if(err){
            throw err;
        }else{
            response.send(rows);
        }
    })
});

//Usuarios - - --  -- -- --  - - - - --  -- - - - - - -- - - - - -
app.get('/users', (request, response) => {
    connection.query("SELECT * FROM historico", (err, rows) => {
        if(err){
            throw err;
        }else{
            response.send(rows);
        }
    })
});

app.delete('/users/:id', (request, response) => {
    connection.query("DELETE FROM users WHERE id = ?", [request.params.id], (err, rows) => {
        if(err){
            throw err;
        }else{
            response.json({rows});
        }
    })
});

//Proveedores - - - --  - - - - - - - - - - - - - - - - - - - - - - -
app.get('/proveedores', (request, response) => {
    connection.query("SELECT * FROM proveedores", (err, rows) => {
        if(err){
            throw err;
        }else{
            response.send(rows);
        }
    })
});

app.delete('/proveedores/:id', (request, response) => {
    connection.query("DELETE * FROM proveedores WHERE id = ?", [request.params.id], (err, rows) => {
        if(err){
            throw err;
        }else{
            response.json({rows});
        }
    })
});

//Simulaciones - - - - - - - - - - - - - - -- - - - - --  - -
app.get('/registro-simulaciones', (request, response) => {
    connection.query("SELECT * FROM registroSimulacion", (err, rows) => {
        if(err){
            throw err;
        }else{
            response.send(rows);
        }
    })
});

//Immueble - - -- - - - - - - - - - - --  - - - -- - - - 
app.get('/inmuebles', (request, response) => {
    connection.query("SELECT * FROM inmuebles", (err, rows) => {
        if(err){
            throw err;
        }else{
            response.json(rows);
        }
    })
});

app.get('/inmuebles/:id', (request, response) => {
    connection.query("SELECT * FROM inmuebles WHERE id = ?", [request.params.id], (err, rows) => {
        if(err){
            throw err;
        }else{
            response.json({rows});
        }
    })
});

app.post('/inmuebles', (request, response)=> {
    let data = {
        antiguedad: request.body.antiguedad,
        habitantes: request.body.habitantes,
        localidad: request.body.localidad,
        serviciosHabilitados: request.body.serviciosHabilitados,
        tipoAntiguedad: request.body.tipoAntiguedad,
        usuario_id: request.body.usuario_id,
        nombre: request.body.nombre
    };

    let sql = "INSERT INTO inmuebles SET ?";

    connection.query(sql, data, function(err , results){
        if(err){
            throw err;
        }else {
            response.send(results);
        }
    })
});


app.delete('/inmuebles/:id', (request, response) => {
    connection.query("DELETE FROM inmuebles WHERE id = ?", [request.params.id], (err, rows) => {
        if(err){
            throw err;
        }else{
            response.json({rows});
        }
    })
});


//RegistroUsuarios  - - -- -- - - - -  -- - - - - -- - -  -
app.get('/registro-users', (request, response) => {
    connection.query("SELECT * FROM registroUsuarios", (err, rows) => {
        if(err){
            throw err;
        }else{
            response.send(rows);
        }
    })
});


//Usuarios - - -  - - - - - - - - - - - - -- -  --  -- - - - 
app.get('/users', (request, response) => {
    connection.query("SELECT * FROM users", (err, rows) => {
        if(err){
            throw err;
        }else{
            response.send(rows);
        }
    })
});

app.post('/users', (request, response)=> {
    let data = {
        apellido: request.body.apellido,
        nombre: request.body.nombre,
        rol: request.body.rol,
        email: request.body
    };

    let sql = "INSERT INTO users SET ?";

    connection.query(sql, data, function(err , results){
        if(err){
            throw err;
        }else {
            response.send(results);
        }
    })
});

//tarifas - - - - -  - - - - - - - - - - - - - -- - - - - 
app.get('/tarifas', (request, response) => {
    connection.query("SELECT * FROM tarifa", (err, rows) => {
        if(err){
            throw err;
        }else{
            response.send(rows);
        }
    })
});


const port = 3000;

app.listen(port, function(){
    console.log("Servidor OK: ", port);
});