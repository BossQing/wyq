package com.zhidisoft.LoginMysql;

import com.zhidisoft.entity.*;
import com.zhidisoft.util.DBUtil;
import org.apache.commons.beanutils.BeanUtils;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Enter {
    public User selectByName(String name) throws Exception {
        String sql = "select * from tb_user where username=?";
        List<Map<String, String>> list = DBUtil.query(sql, name);
        User user = null;
        for (Map<String, String> map : list) {
            user = new User(Integer.parseInt(map.get("id")), map.get("username"), map.get("password"), Integer.parseInt(map.get("taxerId")), map.get("salt"), Integer.parseInt(map.get("permissionId")), Integer.parseInt(map.get("state")), map.get("email"));
        }
        return user;
    }
    public TaxOrgan selectByOrganId(int id) throws Exception {
        String sql = "select * from tb_tax_organ where id=?";
        List<Map<String, String>> list = DBUtil.query(sql, id);
       TaxOrgan user=null;
        for (Map<String, String> map : list) {
            user =new TaxOrgan();
            BeanUtils.populate(user, map);
        }
        return user;
    }
    public Industry selectByIndustryId(int id) throws Exception {
        String sql = "select * from tb_industry where id=?";
        List<Map<String, String>> list = DBUtil.query(sql, id);
        Industry user=null;
        for (Map<String, String> map : list) {
            user=new Industry();
            BeanUtils.populate(user, map);

        }
        return user;
    }
    public User selectByUserId(int id) throws Exception {
        String sql = "select * from tb_user where id=?";
        List<Map<String, String>> list = DBUtil.query(sql, id);
        User user=null;
        for (Map<String, String> map : list) {
            user=new User();
            BeanUtils.populate(user, map);

        }
        return user;
    }
    public TaxSource selectByPayerId(int id) throws Exception {
        String sql = "select * from tb_tax_source where payerId=?";
        List<Map<String, String>> list = DBUtil.query(sql, id);
        TaxSource user=null;
        for (Map<String, String> map : list) {
            user=new TaxSource();
            BeanUtils.populate(user, map);

        }
        return user;
    }
    public Taxer selectByTaxerrecordUserId(int id) throws Exception {
        String sql = "select * from tb_taxer where id=?";
        List<Map<String, String>> list = DBUtil.query(sql, id);
        Taxer user=null;
        for (Map<String, String> map : list) {
            user=new Taxer();
            BeanUtils.populate(user, map);

        }
        return user;
    }
    public List<TaxPayer> selectalltaxpayer() throws Exception {
        String sql = "select * from tb_tax_payer";
        List<Map<String, String>> list = DBUtil.query(sql);
        List<TaxPayer> users = new LinkedList<>();
        for (Map<String, String> map : list) {
            TaxPayer user = new TaxPayer();
            BeanUtils.populate(user, map);
            users.add(user);
        }
        return users;
    }

    public TaxPayer selectByIDtaxpayer(int id) throws Exception {
        String sql = "select * from tb_tax_payer where id=?";
        List<Map<String, String>> list = DBUtil.query(sql, id);
        List<TaxPayer> users = new LinkedList<>();
        TaxPayer user = null;
        for (Map<String, String> map : list) {
            user = new TaxPayer();
            BeanUtils.populate(user, map);
        }
        return user;
    }

    public boolean updatetaxpayer(TaxPayer tp, int id) {
        String sql = "update tb_tax_payer set payerCode=?,payerName=?,legalPerson=?,legalIdCard=?,finaceName=?,finaceIdCard=?,recordDate=? where id=?";
        String[] ss = {tp.getPayerCode(), tp.getPayerName(), tp.getLegalPerson(), tp.getLegalIdCard(), tp.getFinaceName(), tp.getFinaceIdCard(), tp.getRecordDate(), String.valueOf(id)};
        boolean update = DBUtil.update(sql, ss);
        return update;
    }

    public boolean  deletetaxpayer(int id) {
        String sql = "delete from tb_tax_payer where id=?";
        boolean b = DBUtil.update(sql, id);
        return b;
    }
    public boolean  inserttaxsource(TaxSource ts) {
        String sql = "insert into tb_tax_source(PayerId,taskName,subOrganId,approverId,executeId,executeTime,taskState)values(?,?,?,?,?,?,?)";
        String[] ss={String.valueOf(ts.getPayerId()),ts.getTaskName(), String.valueOf(ts.getSubOrganId()), String.valueOf(ts.getApproverId()), String.valueOf(ts.getExecuteId()),ts.getExecuteTime(),ts.getTaskState()};
        boolean b = DBUtil.update(sql,ss);
        return b;
    }
    public boolean  inserttaxpayer(TaxPayer tp) {
        String sql = "insert into tb_tax_payer(payerCode,payerName,bizAddress,taxOrganId,industryId,bizScope ,invoiceType,legalPerson,legalIdCard,legalIdCardImageURL ,finaceName ,finaceIdCard ,finaceIdCardImageURL,bizAddressPhone,recordDate)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        String[] ss={tp.getPayerCode(),tp.getPayerName(),tp.getBizAddress(), String.valueOf(tp.getTaxOrganId()), String.valueOf(tp.getIndustryId()),tp.getBizScope() ,tp.getInvoiceType(),tp.getLegalPerson(),tp.getLegalIdCard(),tp.getLegalIdCardImageURL() ,tp.getFinaceName() ,tp.getFinaceIdCard(),tp.getFinaceIdCardImageURL(),tp.getBizAddressPhone(),tp.getRecordDate()};
        boolean b = DBUtil.update(sql,ss);
        return b;
    }
    public List<Taxer> selectalltaxer() throws Exception {
        String sql = "select * from tb_taxer";
        List<Map<String, String>> list = DBUtil.query(sql);
        List<Taxer> users = new LinkedList<>();
        for (Map<String, String> map : list) {
            Taxer user = new Taxer();
            BeanUtils.populate(user, map);
            users.add(user);
        }
        return users;
    }
    public List<TaxOrgan> selectallOrgan() throws Exception {
        String sql = "select * from tb_tax_organ";
        List<Map<String, String>> list = DBUtil.query(sql);
        List<TaxOrgan> users = new LinkedList<>();
        for (Map<String, String> map : list) {
            TaxOrgan user = new TaxOrgan();
            BeanUtils.populate(user, map);
            users.add(user);
        }
        return users;
    }
    public List<Industry> selectallIndustry() throws Exception {
        String sql = "select * from tb_industry";
        List<Map<String, String>> list = DBUtil.query(sql);
        List<Industry> users = new LinkedList<>();
        for (Map<String, String> map : list) {
            Industry user = new Industry();
            BeanUtils.populate(user, map);
            users.add(user);
        }
        return users;
    }
    public List<User> selectallUser() throws Exception {
        String sql = "select * from tb_user";
        List<Map<String, String>> list = DBUtil.query(sql);
        List<User> users = new LinkedList<>();
        for (Map<String, String> map : list) {
            User user = new User();
            BeanUtils.populate(user, map);
            users.add(user);
        }
        return users;
    }
    public List<Map<String, String>> selectlike(int pageNum, int pagesize,String payerCode,String payerName) throws Exception {
        boolean checkCode=payerCode !=null&&payerCode.toString().length()>0;
        boolean checkName=payerName !=null&&payerName.toString().length()>0;
        String sql ="select * from tb_tax_payer p left join tb_tax_organ o on p.taxOrganId = o.id left join tb_industry i  on p.industryId = i.id  left join tb_user u on p.userId = u.id where p.removeState = 0 ";
        if (checkCode){
            sql=sql+"and p.payerCode="+payerCode;
        }
        if (checkName){
            sql=sql+"and p.payerName like '%"+payerName +"%'";
        }
        sql=sql+" limit ?,?";
        List<Map<String, String>> list = DBUtil.query(sql, (pageNum - 1) * pagesize, pagesize);
        return list;
    }
}
 /* public void save(User user) {
        String sql = "insert into message (name, password) values (?,?)";
        String[] ss = {user.getName(), user.getPassword()};
        DBUtil.update(sql, ss);//这个方法可以完成增删改
    }*/