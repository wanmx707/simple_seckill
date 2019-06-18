package org.seckill.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.entity.Seckill;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器
 */
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit配置文件位置
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SeckillDaoTest {

    @Resource
    private SeckillDao seckillDao;

    @Test
    public void queryById() {
        long id=1000;
        Seckill sk=seckillDao.queryById(id);
        System.out.println(sk.getName());
        System.out.println(sk);
    }

    @Test
    public void queryAll() {
        List<Seckill> sk=seckillDao.queryAll(0,100);
        for(Seckill seckill:sk){
            System.out.println(seckill);
        }
    }

    @Test
    public void reduceNumber() {
        Date killTime=new Date();
        int result=seckillDao.reduceNumber(1000L,killTime);
        System.out.println("result="+result);
    }
}