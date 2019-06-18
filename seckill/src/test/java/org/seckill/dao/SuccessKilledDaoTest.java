package org.seckill.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.entity.SuccessKilled;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SuccessKilledDaoTest {

    @Resource
    private SuccessKilledDao successKilledDao;
    @Test
    public void insertSuccessKilled() {
        long id=1001L;
        long phone=13578459312L;
        int result=successKilledDao.insertSuccessKilled(id,phone);
        System.out.println("result="+result);
    }

    @Test
    public void queryByIdWithSeckill() {
        long id=1001L;
        long phone=13578459312L;
        SuccessKilled sked=successKilledDao.queryByIdWithSeckill(id,phone);
        System.out.println(sked);
        System.out.println(((SuccessKilled) sked).getSeckill());
    }
}