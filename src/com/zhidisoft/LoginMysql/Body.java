package com.zhidisoft.LoginMysql;

import com.zhidisoft.entity.TaxPayer;
import com.zhidisoft.entity.TaxSource;
import com.zhidisoft.entity.Taxer;
import com.zhidisoft.util.DBUtil;
import org.apache.commons.beanutils.BeanUtils;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Body {
    public List<Map<String, String>> selectTaskLike(int pageNum, int pagesize) throws Exception {
//        boolean checkCode=payerCode !=null&&payerCode.toString().length()>0;
//        boolean checkName=payerName !=null&&payerName.toString().length()>0;
        String sql = "select * from tb_tax_source p left join tb_tax_payer o on p.payerId = o.id left join tb_industry n on o.industryId = n.id left join tb_user u on p.payerId = u.id where p.removeState = 0 limit  ?,?";
//        if (checkCode){
//            sql=sql+"and p.payerCode="+payerCode;
//        }
//        if (checkName){
//            sql=sql+"and p.payerName like '%"+payerName +"%'";
//        }
        List<Map<String, String>> list = DBUtil.query(sql, (pageNum - 1) * pagesize, pagesize);
        return list;
    }
    public List<TaxSource> selectallSource() throws Exception {
        String sql = "select * from tb_tax_source";
        List<Map<String, String>> list = DBUtil.query(sql);
        List<TaxSource> users = new LinkedList<>();
        for (Map<String, String> map : list) {
            TaxSource user = new TaxSource();
            BeanUtils.populate(user, map);
            users.add(user);
        }
        return users;
    }
    public TaxSource selectBySourceId(int id) throws Exception {
        String sql = "select * from tb_tax_source where id=?";
        List<Map<String, String>> list = DBUtil.query(sql, id);
        TaxSource user=null;
        for (Map<String, String> map : list) {
            user=new TaxSource();
            BeanUtils.populate(user, map);
        }
        return user;
    }
    public TaxPayer selectByTaxpayerId(int id) throws Exception {
        String sql = "select * from tb_tax_payer where id=?";
        List<Map<String, String>> list = DBUtil.query(sql, id);
        TaxPayer user=null;
        for (Map<String, String> map : list) {
            user=new TaxPayer();
            BeanUtils.populate(user, map);

        }
        return user;
    }
    public boolean  deletetask(int id) {
        String sql = "delete from tb_tax_source where id=?";
        boolean b = DBUtil.update(sql, id);
        return b;
    }
    public boolean updateSource(TaxSource ts, int id) {
        String sql = "update tb_tax_source set taskName=?,subOrganId=?,approverId=?,executeId=?,executeTime=?,taskState=? where id=?";
        String[] ss = {ts.getTaskName(), String.valueOf(ts.getSubOrganId()), String.valueOf(ts.getApproverId()), String.valueOf(ts.getExecuteId()),ts.getExecuteTime(),ts.getTaskState(), String.valueOf(id)};
        boolean update = DBUtil.update(sql, ss);
        return update;
    }
    public TaxPayer selectByTaxpayerPayerCode(String payerCode) throws Exception {
        String sql = "select * from tb_tax_payer where payerCode=?";
        List<Map<String, String>> list = DBUtil.query(sql,payerCode);
        TaxPayer user=null;
        for (Map<String, String> map : list) {
            user=new TaxPayer();
            BeanUtils.populate(user, map);

        }
        return user;
    }
    public static List<Map<String, String>>selectTaxerlimit(int pageNum,int pageSize,String taxerName){
        boolean checkName = taxerName!=null&&taxerName.toString().length()>0;
        String sql = "select * from tb_taxer where state!=1";
        if(checkName){
            sql=sql+" and taxerName like '%"+taxerName+"%' ";
        }
        sql=sql+" limit ?,?";
        List<Map<String, String>> list = DBUtil.query(sql, (pageNum-1)*pageSize,pageSize);
        return list;
    }
    public Taxer selectByTaxerId(int id) throws Exception {
        String sql = "select * from tb_taxer where id=?";
        List<Map<String, String>> list = DBUtil.query(sql, id);
        Taxer user=null;
        for (Map<String, String> map : list) {
            user=new Taxer();
            BeanUtils.populate(user, map);

        }
        return user;
    }
    public boolean  deletetaxer(int id) {
        String sql = "delete from tb_taxer where id=?";
        boolean b = DBUtil.update(sql, id);
        return b;
    }
    public boolean updatetaxer(Taxer tx, int id) {
        String sql = "update tb_taxer set taxerCode=?,taxerName=?,mobile=?,address=?,sex=?,birthday=?,email=?,organId=? where id=?";
        String[] ss = {tx.getTaxerCode(), tx.getTaxerName(),tx.getMobile(),tx.getAddress(),tx.getSex(),tx.getBirthday(),tx.getEmail(), String.valueOf(tx.getOrganId()), String.valueOf(id)};
        boolean update = DBUtil.update(sql, ss);
        return update;
    }
    public boolean  insertTaxer(Taxer tx) {
        String sql = "insert into tb_taxer (taxerCode,taxerName,mobile,address,sex,birthday,email,organId)values(?,?,?,?,?,?,?,?)";
        String[] ss = {tx.getTaxerCode(), tx.getTaxerName(),tx.getMobile(),tx.getAddress(),tx.getSex(),tx.getBirthday(),tx.getEmail(), String.valueOf(tx.getOrganId())};
        boolean b = DBUtil.update(sql,ss);
        return b;
    }
    public boolean updatePassword(String password ,Integer id) {
        String sql = "update tb_user set password=? where id=?";
        boolean update = DBUtil.update(sql,password,id);
        return update;
    }
    public  List<Map<String, String>> selectStatistical(int pageNum,int pageSize,String payerCode,String payerName){
        boolean checkCode = payerCode!=null&&payerCode.toString().length()>0;
        boolean checkName = payerName!=null&&payerName.toString().length()>0;
        String sql = "select * from tb_tax_payer p LEFT join tb_tax_source s on p.id=s.payerId JOIN tb_industry i join tb_tax_organ o join tb_user u on p.taxOrganId=o.id and p.industryId=i.id and p.userId=u.id  where s.id is null and p.removeState=0 ";
        if(checkCode){
            sql=sql+"and p.payerCode = "+payerCode;
        }
        if(checkName){
            sql=sql+" and payerName like '%"+payerName+"%' ";
        }
        sql=sql+" limit ?,?";
        List<Map<String, String>> list = DBUtil.query(sql, (pageNum-1)*pageSize,pageSize);
        return list;
    }
}
