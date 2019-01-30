const express = require('express');
const pool = require('../../pool');
var router=express.Router();


/**
 * get/admin/settings
 * 获取所有的全局设置信息
 * 返回数据：
 * {appName:'xxx',adminUrl:'xxx',appUrl:'xxx',...}
 * {}
 */
router.get('/',(req,res)=>{
    pool.query('SELECT * FROM xfn_settings LIMIT 1',(err,result)=>{
        if(err)throw err;
        res.send(result[0]);
    })
})
/**
 * put/admin/settings
 * 修改所有的全局设置信息
 * {appName:'xxx',adminUrl:'xxx',appUrl:'xxx',...}
 * 返回数据：
 * {code:200,msg:'settings updated success'}
 * {}
 */
router.put('/',(req,res)=>{
    pool.query('UPDATE xfn_settings SET ?',[req.body],(err,result)=>{
        if(err)throw err;
        res.send({code:200,msg:'settings updated success'});
    })
})



module.exports=router;
