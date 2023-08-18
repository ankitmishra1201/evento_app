const express = require('express');
const app = express();
const port = 8080;
const mysql = require('mysql');

app.use(express.json());


const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root123',
    database: 'test',
    port: 3306
});



connection.connect(function (err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }

    console.log('connected as id ' + connection.threadId);
});

app.get('/', (req, res) => {
    res.send('Hello World!');
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});

// app.get('/student',(req,res)=>{
//     let sql="SELECT * FROM student";
//     let query=connection.query(sql,(err,rows)=>{
//         if(err) throw err;
//         res.json(rows);
//     });
// })

const publicuserrouter = require('./routes/publicuser');
app.use('/publicuser', publicuserrouter);

app.post('/push', (req, res) => {
    let data = [req.body.b_id, req.body.name, req.body.accnum, req.body.ifsc, req.body.upi];
    let sql = "call insertbanking(?,?,?,?,?);";
    connection.query(sql, data, (err, rows) => {
        if (err) throw err;
        res.json(rows);
        console.log("Added successfully", rows);
    });
});

app.post('/addprofile', (req, res) => {
    let data = [req.body.username, req.body.password, req.body.fname, req.body.lname, req.body.age, req.body.email, req.body.pnum, req.body.gender, req.body.address, req.body.b_id];
    let sql = "call insertProfiles(?,?,?,?,?,?,?,?,?,?);";
    connection.query(sql, data, (err, rows) => {
        if (err) throw err;
        console.log("Added successfully In Students", rows);
    });

    let data2 = [req.body.username, req.body.password, "customer"];
    let sql2 = "call addAuthenticate(?,?,?);";
    connection.query(sql2, data2, (err, rows) => {
        if (err) throw err;
        console.log("Added successfully In Students", rows);
    });
    res.status(200).json({
        message: "Signup Successful"
    })

});





app.post('/authenticate', async (req, res) => {
    let data = [req.body.username, req.body.password]
    let sql = "SELECT * from authenticate where username=?"
    connection.query(sql, data, (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows);
        console.log("Logged in Successfully")
    })


});

app.post('/eventuser/register', async (req, res) => {
    let data = [req.body.username, req.body.password, req.body.cname, req.body.email, req.body.pnum, req.body.verified, req.body.b_id];
    let sql = "call insertOrganisations(?,?,?,?,?,?,?);"
    connection.query(sql, data, (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows);
        console.log("Sign Up successful");
    })

    let data2 = [req.body.username, req.body.password, "organiser"];
    let sql2 = "call addAuthenticate(?,?,?);";
    connection.query(sql2, data2, (err, rows) => {
        if (err) throw err;
        console.log("Added successfully In Organisations", rows);
    });
    res.status(200).json({
        message: "Signup Successful"
    })
})




app.post('/logistic/register', async (req, res) => {
    let data = [req.body.username, req.body.password, req.body.cname, req.body.email, req.body.pnum, req.body.ctype, req.body.verified, req.body.b_id];
    let sql = "call insertLogistics(?,?,?,?,?,?,?,?);"
    connection.query(sql, data, (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows);
        console.log("Sign Up successful");
    })
    let data2 = [req.body.username, req.body.password, "logistic"];
    let sql2 = "call addAuthenticate(?,?,?);";
    connection.query(sql2, data2, (err, rows) => {
        if (err) throw err;
        console.log("Added successfully In Students", rows);
    });
    res.status(200).json({
        message: "Signup Successful"
    })
})




app.post('/addevents', async (req, res) => {
    let data = [req.body.id, req.body.name, req.body.date, req.body.fin, req.body.venue, req.body.price, req.body.minor, req.body.description, req.body.o_username];
    let sql = "call insertEvents(?,?,?,?,?,?,?,?,?) "
    connection.query(sql, data, (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows),
            console.log("Event Successfully added");

    })
})


app.get('/getevents/:username', async (req, res) => {
    let sql = "Select * from events where o_username in(select username from organisations) and o_username=?"
    connection.query(sql, [req.params.username], (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows);

    })
})

app.get('/showallevents', async (req, res) => {
    let sql = "SELECT * from events";
    connection.query(sql, [req.params], (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows);
    })
})

app.get('/geteventsbyid/:id', async (req, res) => {
    let sql = "SELECT * from events where id=?"
    connection.query(sql, [req.params.id], (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows);
    })
})


app.post('/banking/add', async (req, res) => {
    let data = [req.body.b_id, req.body.name, req.body.accnum, req.body.ifsc, req.body.upi];
    let sql = "call insertBanking(?,?,?,?,?);";
    connection.query(sql, data, (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows);
        console.log("Successfully added in banking");

    })
})

app.post('/registrations/add', async (req, res) => {
    let data = [req.body.p_username, req.body.e_id, req.body.t_id];
    let sql = "call insertRegistrations(?,?,?);";
    connection.query(sql, data, (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows);
        console.log("successfully Registered")
    })
})

app.post('/transactions/add', async (req, res) => {
    let data = [req.body.id, req.body.pmode, req.body.amount,req.body.e_id,req.body.card_no,req.body.card_name,req.body.cvv]
    let sql = "call insertTransactions(?,?,?,?,?,?,?);";
    connection.query(sql, data, (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows);
        console.log("Successfully added transactions");
    })


});

app.get('/geteventslogistic/:username', async (req, res) => {
    let sql = "Select * from events where id in(select e_id from logistic_event where l_username=?);"
    connection.query(sql, [req.params.username], (err, rows) => {
        if (err) throw err;
        res.status(200).json(rows);

    })
})