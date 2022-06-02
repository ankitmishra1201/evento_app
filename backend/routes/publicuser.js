const publicuser=require('../controller/publicuser')

const express=require('express');

const router=express.Router();

router.get('/',publicuser.getstudent);
// router.get('/:id',publicuser.getstudentbyid);
// router.post('/',publicuser.uploadbanking);




module.exports=router;