package org.seckill.dao;

import org.apache.ibatis.annotations.Param;
import org.seckill.entity.SuccessKilled;

public interface SuccessKilledDao {
    /**
     * 插入购买明细，可过滤重复
     * @param killId
     * @param userphone
     * @return 插入的行数
     */
    int insertSuccessKilled(@Param("killId") long killId, @Param("userphone") long userphone);

    /**
     *根据id查询SuccessKilled并携带秒杀产品对象实体
     * @param seckilled
     * @return
     */
    SuccessKilled queryByIdWithSeckill(@Param("seckillId") long seckillId,@Param("userphone") long userphone);
}
