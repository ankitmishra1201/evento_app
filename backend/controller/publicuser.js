const connection=require('../Connection/connection.js');




const getstudent=async(req,res)=>{
    let sql="SELECT * FROM student";
    let query=connection.query(sql,(err,rows)=>{
        if(err) throw err;
        res.json(rows);
    });

}

const getstudentbyid=async(req,res)=>{
  
  let sql="SELECT * FROM student WHERE id=?;"
  connection.query(sql,[req.params.id],(err,rows)=>{
    if(err) throw err;
    res.json(rows);
  });

}

const uploadbanking=async(req,res)=>{
  console.log(req.body);
  var data=({
    b_id:req.body.b_id,
    name:req.body.name,
    accnum:req.body.accnum,
    ifsc:req.body.ifsc,
    upi:req.body.upi

  });
  console.log(data);
  let sql="call insertbanking(?,?,?,?,?)";
  let query=connection.query(sql,data,(err,rows,fields)=>{
      if(err) throw err;
      res.send(JSON.stringify({status:200,error:null,response:rows}));
  });
}



module.exports.getstudent=getstudent;
module.exports.getstudentbyid=getstudentbyid;
module.exports.uploadbanking=uploadbanking;
